// Lazy Singleton
class AppConstant {
  static AppConstant? _instace;
  static AppConstant get instance {
    _instace ??= AppConstant._init();
    return _instace!;
  }

  AppConstant._init();

  final String host = 'ws.pusherapp.com';
  final String cluster = 'eu';
  final String channelName = 'order-1001';
  final String statusEvent = 'status-update';
  final String locationEvent = 'location-update';
  final String mapsIcon = 'assets/images/ic_delivery.png';
  final String deliveryDefaultUserImage = 'assets/images/delivery_default_user.png';
  final String deliveryUserImage = 'assets/images/delivery_user.png';
}

double kZero = 0;
