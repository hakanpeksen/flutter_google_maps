import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import 'feature/maps/view/maps_view.dart';
import 'feature/maps/viewmodel/map_view_model.dart';
import 'product/init/theme/theme_manager.dart';

Future<void> main() async {
  await initApp();

  runApp(ChangeNotifierProvider(
      create: (context) => MapViewModel(), builder: (context, child) => const MyApp()));
}

Future<void> initApp() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  await dotenv.load(fileName: ".env");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Maps',
        theme: ThemeManager().appTheme,
        home: const MapsView());
  }
}
