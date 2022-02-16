import 'package:flutter/material.dart';

enum PaddingValue {
  defaultPadding,
  smallPadding,
  xSmallPadding,
  xxSmallPadding,

  mediumPadding,
  pagePadding,
}

extension PaddingValueExtension on PaddingValue {
  EdgeInsetsGeometry get rawValue {
    switch (this) {
      case PaddingValue.defaultPadding:
        return const EdgeInsets.all(80.0);

      case PaddingValue.smallPadding:
        return const EdgeInsets.symmetric(horizontal: 35.0);
      case PaddingValue.xSmallPadding:
        return const EdgeInsets.all(15);
      case PaddingValue.xxSmallPadding:
        return const EdgeInsets.only(left: 5);

      case PaddingValue.mediumPadding:
        return const EdgeInsets.symmetric(horizontal: 120.0);
      case PaddingValue.pagePadding:
        return const EdgeInsets.symmetric(horizontal: 50.0);
    }
  }
}
