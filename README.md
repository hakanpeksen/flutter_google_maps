# flutter_google_maps

Google Maps Api ve websocket kullanımı  ile sipariş uygulaması örneği yaptım
State Management olarak Provider paketi kullanıldı
 ## Getting Started


Uygulama açıldığında location izni istenir
Pusher servisden 2 tane event dinliyoruz, bunlar Status ve Location eventleridir
Pusher Event => StreamController => StreamBuilder => DeliveryStatusCardWidget(data yı alır) => Ekrana messenger ı basar
Örnek: Status eventinde olay akışı şu şekilde olur
 1- pusher servisde her event geldiğinde;
   Stream tipinde statusController oluşturdum, ve Stream'e event mesajı aktarılır,

   maps_view sayfasında StreamBuilder widgetı ile event mesajı dinlenir,
   StreamBuilder widgetı ise DeliveryStatusCardWidget'ına Stream den gelen datayı yollar ve bu widget ekranda oluşturulur

   MapViewModel de bulunan changeStatusListIndex methodu tetiklenir (view tarafında index e eşit olan circle mavi rengi alır, status'ün durumu belli olur)
