import 'package:flutter/material.dart';
import 'package:flutter_landing/providers/page_provider.dart';
import 'package:flutter_landing/ui/shared/custom_menu_item.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomAppMenu extends StatefulWidget {
  const CustomAppMenu({Key? key}) : super(key: key);

  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController
      controller; //late significa como "calmate, ya lo voy a inicializar!"

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return MouseRegion(
      cursor: SystemMouseCursors
          .click, //al dejar el cursor encima, cambiará la forma del selector(forma de clic, forma como si fuera un campo de texto etc)
      child: GestureDetector(
        onTap: () {
          if (isOpen) {
            controller.reverse(); //cierra el menu
          } else {
            controller.forward(); //abra el menu
          }

          setState(() {
            isOpen = !isOpen; //para cambiar el tamaño
          });
        },
        child: Container(
          width: 150,
          height: isOpen ? 300 : 50,
          color: Colors.black,
          child: Column(
            children: [
              _MenuTitle(isOpen: isOpen, controller: controller),
              if (isOpen) //esto hace que todos los elementos tengan igual proporcion de ancho al menuTile(ya que el menutile era mas ancho que estos y se veia raro)
                ...[
                CustomMenuItem(
                    text: 'Home', onPressed: () => pageProvider.goTo(0)),
                CustomMenuItem(
                    text: 'About', onPressed: () => pageProvider.goTo(1)),
                CustomMenuItem(
                    text: 'Pricing', onPressed: () => pageProvider.goTo(2)),
                CustomMenuItem(
                    text: 'Contact', onPressed: () => pageProvider.goTo(3)),
                CustomMenuItem(
                    text: 'Location', onPressed: () => pageProvider.goTo(4)),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          width: isOpen ? 45 : 0, //espacio entre el borde y la palabra menu
        ),
        Text('Menú',
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
        AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: controller,
          color: Colors.white,
        ),
      ],
    );
  }
}
