import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pusher_client/pusher_client.dart';

import '../../../core/constants/app_constants.dart';
import '../model/order_model.dart';

class PusherClientViewModel {
  late Channel channel;
  late PusherClient pusher;
  final String appKey = dotenv.env['PUSHER_APPKEY'].toString();

  ///  StatusContoller
  final statusController = StreamController<String>();
  Stream<String> get stream => statusController.stream;

  ///  LocationContoller
  final locationController = StreamController<LocationModel>();
  Stream<LocationModel> get locationStream => locationController.stream;

  void initPusher() {
    pusher = PusherClient(
      appKey,
      PusherOptions(
        host: AppConstants.host,
        wsPort: 80,
        cluster: AppConstants.cluster,
        encrypted: false,
      ),
      enableLogging: true,
    );

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

      statusController.sink.add(OrderStatus.fromJson(json.decode(data)).status.toString());
    });

    /// Location Event
    channel.bind(AppConstants.locationEvent, (PusherEvent? event) {
      log(event?.data ?? '');
      final data = event?.data ?? '';

      //sink sayesinde akışa yoluyoruz.
      locationController.sink.add(LocationModel.fromJson(json.decode(data)));
    });
  }
}
