import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../product/init/utility/border_radius_utils.dart';
import '../../../../product/init/utility/padding_utils.dart';
import '../viewmodel/map_view_model.dart';
import 'card_status_image.dart';

part 'delivery_status_part.dart';

class DeliveryStatusCard extends StatelessWidget {
  final String messenger;
  const DeliveryStatusCard({Key? key, required this.messenger}) : super(key: key);

  final String messengerLoading = 'Kurye Bekleniyor';

  @override
  Widget build(BuildContext context) {
    final model = context.read<MapViewModel>();

    return _buildColumnView(model, context);
  }

  Column _buildColumnView(MapViewModel model, BuildContext context) => Column(children: [
        Padding(
          padding: PaddingValue.xSmallPadding.rawValue,
          child: _buildWrapCardContainer(model, context),
        )
      ]);

  // Card Container ın genel tasarımı
  Container _buildWrapCardContainer(MapViewModel model, BuildContext context) => Container(
        color: context.colorScheme.primaryContainer,
        height: context.dynamicHeight(0.28),
        child: Padding(
          padding: PaddingValue.xSmallPadding.rawValue, // EdgeInsets.all(15);
          child: Column(
            children: [
              ///  4 adet circle ve textlerin  oluşturulduğu [Row] tasarımı
              Expanded(flex: 2, child: _buildWrapCircleRow(model, context)),
              const Spacer(),
              // Ekranda kurye Image'ını ve ismini gösterir
              Expanded(
                  flex: 3,
                  child: CardStatusImage(
                      model: model, messenger: messenger, messengerLoading: messengerLoading)),
              const Spacer(),
            ],
          ),
        ),
      );

  ///  4 adet circle ve textlerin  oluşturulduğu [Row] tasarımı
  Row _buildWrapCircleRow(MapViewModel model, BuildContext context) => Row(
          children: model.statusList.map(
        (e) {
          final int index = model.statusList.indexOf(e);
          return _buildCircleColumn(model, index, e, context);
        },
      ).toList());
}
