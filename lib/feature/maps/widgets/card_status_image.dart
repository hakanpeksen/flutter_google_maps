import 'package:flutter/material.dart';
import '../../../product/constants/app_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../product/init/utility/circular_border_radius.dart';
import '../../../product/init/utility/padding_utils.dart';
import '../viewmodel/map_view_model.dart';
import 'circle_avatar_image.dart';
import 'delivery_status_card.dart';

class CardStatusImage extends StatelessWidget {
  const CardStatusImage({
    Key? key,
    required this.model,
    required this.messenger,
    required this.messengerLoading,
  }) : super(key: key);

  final MapViewModel model;
  final String messenger;
  final String messengerLoading;

  @override
  Widget build(BuildContext context) {
    // Ekranda kurye Image'ını ve ismini gösterir
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: CircularBorderRadius.six()), // Sizes.six:6
        child: Padding(
          padding: PaddingValue.xxSmallPadding.rawValue, // EdgeInsets.only(5);
          child: Row(children: [
            // Kurye Image 'ını gösterir
            CircleAvatarImage(model: model),
            SizedBox(width: context.dynamicWidth(0.02)),
            model.currentIndex == kZero
                ? buildStatusText(messengerLoading, context)
                : buildStatusText(messenger, context),
          ]),
        ));
  }
}
