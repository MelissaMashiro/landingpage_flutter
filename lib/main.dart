import 'package:flutter/material.dart';
import 'package:flutter_landing/router/router.dart';
import 'package:flutter_landing/ui/pages/home_page.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My landing Page',
      initialRoute: '/home',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
