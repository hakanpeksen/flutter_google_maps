import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../service/location_service.dart';
import '../service/pusher_service.dart';

import '../widgets/location_stream_builder.dart';

import '../widgets/custom_google_maps.dart';
import '../widgets/status_stream_builder.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  late final LocationService _locationService;
  late final IPusherService _pusherService;
  final String _appTitle = 'Delivery Example';

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Scaffold buildScaffold() => Scaffold(
        appBar: _buildAppBar,
        body: _buildBodyView(),
      );

  AppBar get _buildAppBar => AppBar(title: Text(_appTitle), actions: [
        Padding(
          padding: context.paddingLow, //  EdgeInsets.all(height * 0.01);
          child: LocationStreamBuilder(pusherService: _pusherService),
        )
      ]);

  Stack _buildBodyView() => Stack(children: [
        const CustomGoogleMaps(),
        Positioned(
            right: 0,
            left: 0,
            bottom: 0,
            child: StatusStreamBuilder(pusherService: _pusherService)),
      ]);
}
