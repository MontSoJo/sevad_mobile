import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sevad_mobile/screens/screens.dart';

import 'package:sevad_mobile/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => VisitsService())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sevad Mobile',
        initialRoute: 'login',
        routes: {
          'login': (_) => LoginScreen(),
          'list': (_) => ListScreen(),
          'map': (_) => MapScreen()
        });
  }
}
