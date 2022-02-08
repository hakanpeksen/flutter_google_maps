import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';

import '../../../../product/constants/app_constants.dart';
import '../../../../product/init/utility/border_radius_utils.dart';
import '../../../../product/init/utility/circular_border_radius.dart';
import '../../../../product/init/utility/padding_utils.dart';
import '../viewmodel/map_view_model.dart';

part 'delivery_status_part_widget.dart';

class DeliveryStatusCardWidget extends StatelessWidget {
  final String messenger;
  const DeliveryStatusCardWidget({Key? key, required this.messenger}) : super(key: key);

  final String messengerLoading = 'Kurye Bekleniyor';

  @override
  Widget build(BuildContext context) {
    final model = context.read<MapViewModel>();

    return Column(
      children: [
        Padding(
          padding: PaddingValue.xSmallPadding.rawValue,
          child: _buildCardContainer(context, model),
        ),
      ],
    );
  }

  // Card Container ın genel tasarımı
  Container _buildCardContainer(BuildContext context, MapViewModel model) {
    return Container(
      color: context.colorScheme.primaryContainer,
      height: context.dynamicHeight(0.28),
      child: Padding(
        padding: PaddingValue.xSmallPadding.rawValue, // EdgeInsets.all(15);
        child: Column(
          children: [
            ///  4 adet circle ve textlerin  oluşturulduğu [Row] tasarımı
            Expanded(flex: 2, child: _buildCircleRow(model, context)),
            const Spacer(),
            // Ekranda kurye ismi yazdırılır
            Expanded(
                flex: 3,
                child: _buildStatusCardImageAndText(model, context, messenger, messengerLoading)),
            const Spacer(),
          ],
        ),
      ),
    );
  }

  ///  4 adet circle ve textlerin  oluşturulduğu [Row] tasarımı
  Row _buildCircleRow(MapViewModel model, BuildContext context) {
    return Row(
      children: model.statusList.map(
        (e) {
          final int index = model.statusList.indexOf(e);
          return _buildCircleColumn(model, index, e, context);
        },
      ).toList(),
    );
  }
}

extension DeliveryStatusCardExtension on DeliveryStatusCardWidget {
  DeliveryStatusCardWidget show<T>(BuildContext context) {
    return this;
  }
}