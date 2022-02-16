import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderStatus {
  final String? status;
  final String? rider;

  OrderStatus({this.status, this.rider});

  factory OrderStatus.fromJson(Map<String, dynamic> data) => _$OrderStatusFromJson(data);
}

@JsonSerializable(createToJson: false)
class LocationModel {
  final double? latitude;
  final double? longitude;
  final int? estimated;

  LatLng get latlong => LatLng(latitude ?? 0, longitude ?? 0);

  LocationModel({
    this.latitude,
    this.longitude,
    this.estimated,
  });

  factory LocationModel.fromJson(Map<String, dynamic> data) => _$LocationModelFromJson(data);
}
