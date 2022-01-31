import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kartal/kartal.dart';

import '../../service/location_service.dart';
import '../viewmodel/map_view_model.dart';

class MapsView extends StatefulWidget {
  const MapsView({Key? key}) : super(key: key);

  @override
  _MapsViewState createState() => _MapsViewState();
}

class _MapsViewState extends State<MapsView> {
  late final MapViewModel _mapViewModel;
  late final ILocationService _locationService;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //1.yol
    // _mapViewModel = MapViewModel(LocationService());
    // _mapViewModel.locationService.getPermission();
    _mapViewModel = MapViewModel();
    _locationService = LocationService();
  }

  @override
  void dispose() {
    _locationService.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            buildGoogleMap(),
          ],
        ),
      ),
    );
  }

  GoogleMap buildGoogleMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(target: _mapViewModel.initialCameraPosition),
      mapType: MapType.normal,
      onMapCreated: _locationService.onMapCreated,
      myLocationEnabled: false,
      markers: _mapViewModel.createMarker(),
      // markers: _mapViewModel.markers,
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
    );
  }
}
