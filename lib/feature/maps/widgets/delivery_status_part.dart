part of 'delivery_status_card.dart';

Column _buildCircleColumn(MapViewModel model, int index, String e, BuildContext context) {
  return Column(
    children: [
      // Card da bulunan 4 adet  circle'ı oluşturur
      _buildCircleContainer(model, index, context),
      SizedBox(height: context.dynamicHeight(0.02)),
      //(index e eşit olan circle mavi rengi alır)
      model.currentIndex == index
          ? buildStatusText(e, context,
              textColor: context.colorScheme.primary) // AppColors.mainBlue,
          : buildStatusText(e, context,
              textColor: context.colorScheme.secondary), // AppColors.grey,
    ],
  );
}

// Card da bulunan 4 adet  circle'ı oluşturur
Container _buildCircleContainer(MapViewModel model, int index, BuildContext context) => Container(
      width: _buildCircleWidthAndHeight(model, index),
      height: _buildCircleWidthAndHeight(model, index),
      margin: PaddingValue.smallPadding.rawValue, // EdgeInsets.only(left: 35.0, right: 35.0);
      decoration: buildBoxDecoration(model, index, context),
    );

double _buildCircleWidthAndHeight(MapViewModel model, int index) =>
    model.currentIndex == index ? Sizes.twelwe.rawValue() : Sizes.eight.rawValue();

BoxDecoration buildBoxDecoration(MapViewModel model, int index, BuildContext context) =>
    BoxDecoration(
        shape: BoxShape.circle,
        color: model.currentIndex == index
            ? context.colorScheme.primary
            : context.colorScheme.secondary);

// Card da bulunan 4 adet status textleri  oluşturur,
// Card da bulunan kurye ismi, 'kurye bekleniyor' kısmını  oluşturur
Text buildStatusText(String e, BuildContext context, {Color? textColor}) =>
    Text(e.toString(), style: context.textTheme.subtitle2?.copyWith(color: textColor));
