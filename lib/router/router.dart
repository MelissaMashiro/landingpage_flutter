import 'package:fluro/fluro.dart';
import 'package:flutter_landing/router/router_handler.dart';

class Flurorouter {
  static final FluroRouter router = new FluroRouter();

  static void configureRoutes() {
    //Rutas
    router.define('/:page', handler: homeHandler);

    //404
    router.notFoundHandler = homeHandler;
    
  }
}
