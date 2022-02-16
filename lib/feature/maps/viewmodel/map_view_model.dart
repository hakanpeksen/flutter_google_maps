import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../product/constants/app_constants.dart';
import '../model/order_model.dart';
import '../widgets/delivery_status_card.dart';

class MapViewModel extends ChangeNotifier {
  GoogleMapController? controller;
  Marker? marker;
  late BitmapDescriptor _markerIcon;
  LatLng initialCameraPosition = const LatLng(40.9817, 29.0310);
  final double cameraPositionZoom = 16;

  /// [DeliveryStatusCard] Status list
  int currentIndex = -1;

  List<String> statusList = ['Sırada', 'Hazırlanıyor', 'Yola Çıktı', 'Adreste'];

  // Update Status Card Circle (index e eşit olan circle mavi rengi alır)
  void changeStatusListIndex() {
    if (currentIndex == 3) currentIndex = -1;
    currentIndex += 1;
  }

  Future<void> setMarkerIcon() async {
    _markerIcon =
        await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), AppConstants.mapsIcon);
  }

  /// Event geldiğinde [GoogleMapsCustomWidget] da bulunan Maps üzerindeki Marker'ın yer değiştirmesi sağlanır
  void updateMarkerLatLng(LocationModel result) {
    controller?.animateCamera(CameraUpdate.newLatLng(result.latlong));
    marker = Marker(
        markerId: MarkerId(result.latitude.toString()),
        position: result.latlong,
        draggable: false,
        zIndex: 2,
        flat: true,
        icon: _markerIcon,
        anchor: const Offset(0.5, 0.5));

    notifyListeners();
  }
}
