import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderStatus {
  final String? status;
  final String? kurye;

  OrderStatus({this.status, this.kurye});

  factory OrderStatus.fromJson(Map<String, dynamic> data) => _$OrderStatusFromJson(data);
}

@JsonSerializable()
class LocationModel {
  final String? latitude;
  final String? longitude;
  final int? estimated;

  LocationModel({
    this.latitude,
    this.longitude,
    this.estimated,
  });

  factory LocationModel.fromJson(Map<String, dynamic> data) => _$LocationModelFromJson(data);
}
