import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './screens/main_screen.dart';
import './screens/fav_screen.dart';
import './screens/values_screen.dart';

import 'theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      home: Home(),
      theme: AppTheme.light,
      defaultTransition: Transition.fade,
      transitionDuration: Duration(seconds: 1),
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: "/fav", page: () => Favourites()),
        GetPage(name: "/val", page: () => ValuesScreen()),
      ],
    ),
  );
}
