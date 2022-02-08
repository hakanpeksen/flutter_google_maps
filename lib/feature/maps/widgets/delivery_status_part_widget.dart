part of 'delivery_status_card_widget.dart';

Column _buildCircleColumn(MapViewModel model, int index, String e, BuildContext context) {
  return Column(
    children: [
      // Card da bulunan 4 adet  circle'ı oluşturur
      _buildCircleContainer(model, index, context),

      SizedBox(height: context.dynamicHeight(0.02)),
      model.currentIndex == index
          ? _buildStatusText(e, context, context.colorScheme.primary) // AppColors.mainBlue,
          : _buildStatusText(e, context, context.colorScheme.secondary), // AppColors.grey,
    ],
  );
}

// Card da bulunan 4 adet  circle'ı oluşturur
Container _buildCircleContainer(MapViewModel model, int index, BuildContext context) {
  return Container(
    width: model.currentIndex == index ? Sizes.twelwe.rawValue() : Sizes.eight.rawValue(),
    height: model.currentIndex == index ? Sizes.twelwe.rawValue() : Sizes.eight.rawValue(),
    margin: PaddingValue.smallPadding.rawValue, // EdgeInsets.only(left: 35.0, right: 35.0);
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: model.currentIndex == index
            ? context.colorScheme.primary
            : context.colorScheme.secondary),
  );
}

// Card da bulunan 4 adet status textleri  oluşturur
Text _buildStatusText(String e, BuildContext context, Color textColor) {
  return Text(
    e.toString(),
    style: context.textTheme.subtitle2?.copyWith(color: textColor),
  );
}

// Ekranda kurye ismi yazdırılır
Card _buildStatusCardImageAndText(
    MapViewModel model, BuildContext context, String messenger, String messengerLoading) {
  return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: CircularBorderRadius.six(), // Sizes.six:6
      ),
      child: Padding(
        padding: PaddingValue.xxSmallPadding.rawValue, // EdgeInsets.only(5);
        child: Row(children: [
          CircleAvatar(

              /// [model.currentIndex == 0] =>  ilk Event geldiğinde default image ve
              //bekleniyor yazısının gösterimi için kullanıldı
              child: model.currentIndex == 0
                  ? ClipOval(child: Image.asset(AppConstants.deliveryDefaultUserImage))
                  : ClipOval(child: Image.asset(AppConstants.deliveryUserImage)),
              backgroundColor: Colors.transparent,
              radius: 30),
          SizedBox(width: context.dynamicWidth(0.02)),
          model.currentIndex == 0
              ? Text(messengerLoading, style: context.textTheme.subtitle2)
              : Text(messenger, style: context.textTheme.subtitle2),
        ]),
      ));
}
