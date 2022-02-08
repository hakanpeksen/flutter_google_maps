enum Sizes { zero, four, five, six, eight, ten, twelwe, fourTeen, sixTeen, extraCircle, buttonSize }

extension SizesExtension on Sizes {
  double rawValue() {
    switch (this) {
      case Sizes.zero:
        return 0;
      case Sizes.four:
        return 4;
      case Sizes.five:
        return 5;
      case Sizes.six:
        return 6;
      case Sizes.eight:
        return 8;
      case Sizes.ten:
        return 10;
      case Sizes.twelwe:
        return 12;
      case Sizes.fourTeen:
        return 14;
      case Sizes.sixTeen:
        return 16;
      case Sizes.buttonSize:
        return 30;
      case Sizes.extraCircle:
        return 100;
    }
  }
}
