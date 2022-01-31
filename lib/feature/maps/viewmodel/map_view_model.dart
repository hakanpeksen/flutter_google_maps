import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'map_view_model.g.dart';

class MapViewModel = _MapViewModelBase with _$MapViewModel;

abstract class _MapViewModelBase with Store {
  //final ILocationService locationService;
  // _MapViewModelBase(this.locationService);
  _MapViewModelBase();

  LatLng initialCameraPosition = const LatLng(40.9817, 29.0310); // caferağa
  // final LatLng initialCameraPosition = const LatLng(40.9856, 29.0694); // incirli sok

  Set<Marker> createMarker() {
    return <Marker>{
      Marker(
          infoWindow: const InfoWindow(title: "Hakan"),
          markerId: const MarkerId("1"),
          //position: _initalCameraPosition.target,
          position: const LatLng(40.9817, 29.0310),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)),
      Marker(
          infoWindow: const InfoWindow(title: "Harun"),
          markerId: const MarkerId("2"),
          position: const LatLng(40.987384, 29.0263703),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)),
      Marker(
          infoWindow: const InfoWindow(title: "Rita"),
          markerId: const MarkerId("3"),
          position: const LatLng(40.9777779, 29.0362482),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure)),
    };
  }
}
