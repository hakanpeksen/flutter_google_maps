import 'package:flutter/material.dart';

import '../../../product/constants/app_constants.dart';
import '../../../product/init/utility/border_radius_utils.dart';
import '../viewmodel/map_view_model.dart';

// Kurye Image 'ını gösterir
class CircleAvatarImage extends StatelessWidget {
  const CircleAvatarImage({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MapViewModel model;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        child: _circleAvatarImageChild(model),
        backgroundColor: Colors.transparent,
        radius: Sizes.buttonSize.rawValue());
  }

  /// [model.currentIndex == 0] =>  ilk Event geldiğinde default image ve
  /// bekleniyor yazısının gösterimi için kullanıldı
  Widget _circleAvatarImageChild(MapViewModel model) => model.currentIndex == 0
      ? ClipOval(child: Image.asset(AppConstants.deliveryDefaultUserImage))
      : ClipOval(child: Image.asset(AppConstants.deliveryUserImage));
}
