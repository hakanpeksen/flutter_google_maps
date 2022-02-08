import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:kartal/kartal.dart';

import '../model/order_model.dart';
import '../service/location_service.dart';
import '../service/pusher_service.dart';
import '../viewmodel/map_view_model.dart';
import '../widgets/delivery_status_card_widget.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  late final LocationService _locationService;
  late final IPusherService _pusherService;
  final String _appTitle = 'Delivery Example';
  final double _cameraPositionZoom = 15;

  @override
  void initState() {
    super.initState();
    // Maps de bulunan marker Image ı setlenir
    context.read<MapViewModel>().setMarkerIcon();
    _locationService = LocationService();
    _locationService.getPermission();

    _pusherService = PusherService(context);
    // Pusher Service'ini başlatıyoruz
    _pusherService.initPusher();
  }

  @override
  void dispose() {
    // PusherService Stream'lerini  kapatıyoruz
    _pusherService.locationController.close();
    _pusherService.statusController.close();

    // Maps controller ı kapatıyoruz
    context.read<MapViewModel>().controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBodyView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_appTitle),
      actions: [
        Padding(
            padding: context.paddingLow, //  EdgeInsets.all(height * 0.01);
            child: _buildStreamLocationBuilder())
      ],
    );
  }

  Stack _buildBodyView() {
    return Stack(children: [
      _buildGoogleMap(),
      Positioned(right: 0, left: 0, bottom: 0, child: _buildStreamStatusBuilder()),
    ]);
  }

  GoogleMap _buildGoogleMap() {
    final mapModel = context.watch<MapViewModel>();
    return GoogleMap(
      initialCameraPosition:
          CameraPosition(target: mapModel.initialCameraPosition, zoom: _cameraPositionZoom),
      mapType: MapType.normal,
      onMapCreated: (controller) {
        context.read<MapViewModel>().controller = controller;
      },
      myLocationEnabled: true,
      markers: Set.of((mapModel.marker != null) ? [mapModel.marker!] : []),
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
    );
  }

  Center _loadingWidget() {
    return const Center(child: CircularProgressIndicator());
  }

  Center _notFoundTextWidget() {
    return const Center(child: Text('No data'));
  }

  StreamBuilder<String> _buildStreamStatusBuilder() {
    return StreamBuilder<String>(
      stream: _pusherService.stream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          final data = snapshot.data ?? '';
          // Card da  bulunan 4 adet circle'ın Event geldiği anda mavi rengi alması sağlanır
          return DeliveryStatusCardWidget(messenger: data).show(context);
        }
        return _notFoundTextWidget();
      },
    );
  }

  StreamBuilder<LocationModel> _buildStreamLocationBuilder() {
    return StreamBuilder<LocationModel>(
      stream: _pusherService.locationStream,
      builder: (context, AsyncSnapshot<LocationModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _loadingWidget();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          final data = snapshot.data;
          return Center(
            child: Text('Tahmini Süre: ${data?.estimated.toString() ?? ''}',
                style: context.textTheme.headline4),
          );
        }
        return _notFoundTextWidget();
      },
    );
  }
}
