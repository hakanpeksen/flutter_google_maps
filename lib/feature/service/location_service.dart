import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

abstract class ILocationService {
  Future<void> getPermission();
  void onMapCreated(GoogleMapController _cntlr);
  GoogleMapController? controller;

  // Location
  final location = Location();
  PermissionStatus? _permissionGranted;

  // kullanıcının ilk konumu ve mevcut konumu
  LocationData? _currentLocation;
  late bool _serviceEnabled;
}

class LocationService extends ILocationService {
// location izni istenir
  @override
  Future<void> getPermission() async {
    // location service enabled
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    // location a  erişim izni kontrolü
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    // kullanıcının mevcut konumunu al
    _currentLocation = await location.getLocation();
  }

  @override
  void onMapCreated(GoogleMapController _cntlr) {
    controller = _cntlr;
    // cihazın konumu her değiştiğinde kamera yeni konuma taşınır
    location.onLocationChanged.listen((LocationData l) {
      // _currentLocation = l;
      controller?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude ?? 0, l.longitude ?? 0), zoom: 15)));
      // markers.add(
      //   Marker(
      //       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
      //       infoWindow: const InfoWindow(title: "Hakan"),
      //       markerId: MarkerId('Home'),
      //       position: LatLng(l.latitude ?? 0, l.longitude ?? 0))),
    });
  }
}
