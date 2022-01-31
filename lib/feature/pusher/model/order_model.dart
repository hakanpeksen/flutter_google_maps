import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable(createToJson: false)
class OrderStatus {
  String? status;

  OrderStatus({
    this.status,
  });

  factory OrderStatus.fromJson(Map<String, dynamic> data) => _$OrderStatusFromJson(data);
}

@JsonSerializable()
class LocationModel {
  String? kurye;
  String? latitude;
  String? longitude;
  int? estimated;

  LocationModel({
    this.kurye,
    this.latitude,
    this.longitude,
    this.estimated,
  });

  factory LocationModel.fromJson(Map<String, dynamic> data) => _$LocationModelFromJson(data);
}
