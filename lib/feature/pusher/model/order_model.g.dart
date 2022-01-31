// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatus _$OrderStatusFromJson(Map<String, dynamic> json) => OrderStatus(
      status: json['status'] as String?,
    );

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      kurye: json['kurye'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      estimated: json['estimated'] as int?,
    );

Map<String, dynamic> _$LocationModelToJson(LocationModel instance) =>
    <String, dynamic>{
      'kurye': instance.kurye,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'estimated': instance.estimated,
    };
