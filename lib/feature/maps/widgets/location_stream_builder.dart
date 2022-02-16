import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../model/order_model.dart';
import '../service/pusher_service.dart';
import 'loading_center.dart';
import 'not_found_text.dart';

class LocationStreamBuilder extends StatelessWidget {
  const LocationStreamBuilder({Key? key, required this.pusherService}) : super(key: key);

  final IPusherService pusherService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocationModel>(
      stream: pusherService.locationStream,
      builder: (context, AsyncSnapshot<LocationModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingCenter();
        }
        if (snapshot.connectionState == ConnectionState.active && snapshot.hasData) {
          final data = snapshot.data;
          return Center(
            child: Text('Tahmini Süre: ${data?.estimated.toString() ?? ''} dk',
                style: context.textTheme.headline4),
          );
        }
        return const NotFoundText();
      },
    );
  }
}
