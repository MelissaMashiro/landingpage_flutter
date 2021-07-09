import 'package:fluro/fluro.dart';
import 'package:flutter_landing/providers/page_provider.dart';
import 'package:flutter_landing/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(handlerFunc: (context, params) {
  final page = params['page']!.first;
  if (page !='/') //como es una landing page, siempre estará en la ruta del home que es '/' pero si se coloca una ruta diferenete, ahi si en el url, lo redirigirá al homePage .
  {
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    pageProvider.createScrollController(
        page); //este scroll controller fue el necesario apra que al poner en el url la ruta a donde quiero ir, me lleve a donde es y no me abra al apgina en el view de home siempre

    return HomePage();
  }
});
