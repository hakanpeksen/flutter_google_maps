part of 'delivery_status_card_widget.dart';

Column _buildCircleColumn(MapViewModel model, int index, String e, BuildContext context) {
  return Column(
    children: [
      // Card da bulunan 4 adet  circle'ı oluşturur
      _buildCircleContainer(model, index, context),
      SizedBox(height: context.dynamicHeight(0.02)),
      //(index e eşit olan circle mavi rengi alır)
      model.currentIndex == index
          ? _buildStatusText(e, context, context.colorScheme.primary) // AppColors.mainBlue,
          : _buildStatusText(e, context, context.colorScheme.secondary), // AppColors.grey,
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

// Card da bulunan 4 adet status textleri  oluşturur
Text _buildStatusText(String e, BuildContext context, Color textColor) =>
    Text(e.toString(), style: context.textTheme.subtitle2?.copyWith(color: textColor));

// Ekranda kurye ismi yazdırılır
Card _buildStatusCardImageAndText(
        MapViewModel model, BuildContext context, String messenger, String messengerLoading) =>
    Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: CircularBorderRadius.six()), // Sizes.six:6
        child: Padding(
          padding: PaddingValue.xxSmallPadding.rawValue, // EdgeInsets.only(5);
          child: Row(children: [
            buildCircleAvatarImage(model),
            SizedBox(width: context.dynamicWidth(0.02)),
            model.currentIndex == 0
                ? buildMessengerText(messengerLoading, context)
                : buildMessengerText(messenger, context),
          ]),
        ));

// Card da bulunan kurye ismi, 'kurye bekleniyor' kısmını  oluşturur
Text buildMessengerText(String e, BuildContext context) =>
    Text(e, style: context.textTheme.subtitle2);

/// [model.currentIndex == 0] =>  ilk Event geldiğinde default image ve
//bekleniyor yazısının gösterimi için kullanıldı
CircleAvatar buildCircleAvatarImage(MapViewModel model) => CircleAvatar(
    child: circleAvatarChild(model),
    backgroundColor: Colors.transparent,
    radius: Sizes.buttonSize.rawValue());

Widget circleAvatarChild(MapViewModel model) => model.currentIndex == 0
    ? ClipOval(child: Image.asset(AppConstants.deliveryDefaultUserImage))
    : ClipOval(child: Image.asset(AppConstants.deliveryUserImage));
