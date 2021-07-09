import 'package:flutter/material.dart';
import 'package:flutter_landing/providers/page_provider.dart';
import 'package:flutter_landing/router/router.dart';
import 'package:provider/provider.dart'; 

void main() {
  Flurorouter.configureRoutes();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> PageProvider())
      ],
          child: MaterialApp(
        title: 'My landing Page',
        initialRoute: '/home',
        onGenerateRoute: Flurorouter.router.generator,
      ),
    );
  }
}
