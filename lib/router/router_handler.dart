import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_landing/ui/pages/home_page.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  return HomePage();
});
