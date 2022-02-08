# flutter_google_maps

Google Maps Api ve websocket kullanımı  ile sipariş uygulaması örneği yaptım
State Management olarak Provider paketi kullanıldı

## Getting Started

Uygulama açıldığında location izni istenir
Pusher servisden 2 tane event dinliyoruz, bunlar Status ve Location eventleridir
Pusher Event => StreamController => StreamBuilder => DeliveryStatusCardWidget(data yı alır) => Ekrana messenger ı basar
Örnek: Status eventinde olay akışı şu şekilde olur
 1- her event geldiğinde pusher servis MapViewModel de bulunan ilgili methoda event mesaj parametresini
gönderir, bir de Stream tipinde statusController oluşturdum, ve Stream e bu data aktarılır
2- bu method ise gelen parametreyi DeliveryStatusCardWidget'ına  gönderir
3- maps_view sayfasında StreamBuilder widgetı ile bu data dinlenir,
4- DeliveryStatusCardWidget(messenger: data).show(context); widget ına Stream den gelen datayı yollar






A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
