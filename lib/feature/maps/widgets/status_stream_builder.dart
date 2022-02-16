import 'package:flutter/material.dart';

import '../service/pusher_service.dart';
import 'loading_center.dart';
import 'delivery_status_card.dart';
import 'not_found_text.dart';

class StatusStreamBuilder extends StatelessWidget {
  const StatusStreamBuilder({Key? key, required this.pusherService}) : super(key: key);

  final IPusherService pusherService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: pusherService.stream,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCenter();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          final data = snapshot.data ?? '';
          // Card da  bulunan 4 adet circle'ın Event geldiği anda mavi rengi alması sağlanır
          return DeliveryStatusCard(messenger: data);
        }
        return const NotFoundText();
      },
    );
  }
}
