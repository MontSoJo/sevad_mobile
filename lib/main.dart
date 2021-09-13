import 'package:flutter/material.dart';
import 'package:sevad_mobile/screens/screens.dart';

import 'package:sevad_mobile/services/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sevad Mobile',
        initialRoute: 'login',
        routes: {'login': (_) => LoginScreen(), 'home': (_) => HomeScreen()});
  }
}
