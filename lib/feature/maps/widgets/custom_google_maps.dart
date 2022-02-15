import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../viewmodel/map_view_model.dart';

class CustomGoogleMaps extends StatefulWidget {
  const CustomGoogleMaps({Key? key}) : super(key: key);

  @override
  _CustomGoogleMapsState createState() => _CustomGoogleMapsState();
}

class _CustomGoogleMapsState extends State<CustomGoogleMaps> {
  @override
  void initState() {
    super.initState();
    // Maps de bulunan marker Image ı setlenir
    context.read<MapViewModel>().setMarkerIcon();
  }

  @override
  void dispose() {
    // Maps controller ı kapatıyoruz
    context.read<MapViewModel>().controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapModel = context.watch<MapViewModel>();
    return GoogleMap(
      initialCameraPosition: CameraPosition(
          target: mapModel.initialCameraPosition,
          zoom: context.read<MapViewModel>().cameraPositionZoom),
      mapType: MapType.normal,
      onMapCreated: (controller) {
        context.read<MapViewModel>().controller = controller;
      },
      myLocationEnabled: true,
      markers: setMarker(mapModel),
      tiltGesturesEnabled: true,
      compassEnabled: true,
      scrollGesturesEnabled: true,
      zoomGesturesEnabled: true,
    );
  }
}

Set<Marker> setMarker(MapViewModel mapModel) =>
    Set.of((mapModel.marker != null) ? [mapModel.marker!] : []);
