import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:provider/provider.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../product/constants/app_constants.dart';
import '../viewmodel/map_view_model.dart';

import '../model/order_model.dart';

abstract class IPusherService {
  late Channel channel;
  late PusherClient pusher;
  final String appKey = dotenv.env['PUSHER_APPKEY'].toString();

  ///  StatusContoller
  final statusController = StreamController<String>();
  Stream<String> get stream => statusController.stream;

  ///  LocationContoller
  final locationController = StreamController<LocationModel>();
  Stream<LocationModel> get locationStream => locationController.stream;

  void initPusher();

  final BuildContext context;
  IPusherService(this.context);
}

class PusherService extends IPusherService {
  PusherService(BuildContext context) : super(context);

  @override
  void initPusher() {
    pusher = PusherClient(
        appKey,
        PusherOptions(
            host: AppConstants.host, wsPort: 80, cluster: AppConstants.cluster, encrypted: false),
        enableLogging: true);

    // channel a abone ol
    channel = pusher.subscribe(AppConstants.channelName);

    pusher.onConnectionStateChange((state) {
      log("previousState: ${state?.previousState}, currentState: ${state?.currentState}");
    });

    pusher.onConnectionError((error) {
      log("error: ${error?.message}");
    });

    ///  Status Event
    channel.bind(AppConstants.statusEvent, (PusherEvent? event) {
      log(event?.data ?? '');
      final data = event?.data ?? '';
      final messenger = OrderStatus.fromJson(json.decode(data)).kurye.toString();
      statusController.sink.add(messenger);

      /// send to [statusEvent] Update Status Card
      context.read<MapViewModel>().deliveryStatus(context, messenger);
    });

    /// Location Event
    channel.bind(AppConstants.locationEvent, (PusherEvent? event) {
      log(event?.data ?? '');
      final data = event?.data ?? '';
      LocationModel result = LocationModel.fromJson(json.decode(data));
      //sink sayesinde akışa yoluyoruz.
      locationController.sink.add(result);

      /// Event geldiğinde Maps üzerindeki Marker'ın yer değiştirmesi sağlanır
      context.read<MapViewModel>().updateMarkerLatLng(result);
    });
  }
}
