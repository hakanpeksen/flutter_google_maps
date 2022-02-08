import 'package:location/location.dart';

class LocationService {
  final location = Location();
  LocationData? _currentLocation;

  late bool _serviceEnabled;
  PermissionStatus? _permissionGranted;

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
}
