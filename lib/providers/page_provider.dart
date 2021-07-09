//import 'dart:html'  as html ;
import 'package:universal_html/html.dart'
    as html; //este packete  es igualñ al de arriba, pero el de arriba solo servia para sitios web
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = new PageController();

  List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];
  int _currentIndex = 0;

  createScrollController(String routeName) {
    //esto para que al entrar al link con una url especifica, me lleve  a la pagina inicial respectiva segun el url, y no al home view inicial por devfecto
    this.scrollController =
        new PageController(initialPage: getPageIndex(routeName));

    html.document.title = _pages[getPageIndex(
        routeName)]; //solo es para cambiar el titulo globald e la pestaña web

    //listener para que al scrollear por las distintas views, se vaya actualizando la url respectiva
    this.scrollController.addListener(() {
      //se ejecuta cada vez que scrolleo, por eso pongo la condicion if, para q solo se ejecute la accion si el index es diferente al actual
      final index = (this.scrollController.page ?? 0)
          .round(); //por defecto si es null, usa el index 0
      //(el round es porque el listener va sumando de 0 a 1 a 2 con decimales  y asi para lelgar al siguiente index, y obviamente no tengo un index que sea 0.23 0.98, entonnces lo redondeo para q vaya de 0 a 1 a 2 a 3 ...)
      print('INDEX=> $index');
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        html.document.title = _pages[getPageIndex(routeName)];
      }
    });
  }

//validacion antes de tomar cualquer index
  int getPageIndex(String routeName) {
    //si el index de la apgina digitado, no existe, devuelve un -1,por lo que le mostraremos la apgina en el index 0,que es el Home por defecto
    return (_pages.indexOf(routeName) == -1) ? 0 : _pages.indexOf(routeName);
  }

  goTo(int index) {
    // final routeName = _pages[index];
    //la siguiente linea de winow, es solo para cmabiar el url al navegar a cada pantalla(porque como todas estan en el home, el url nunca cambiaba)
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    scrollController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
