import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          height: 50,
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                width: isOpen ? 50 : 0,//espacio entre el borde y la palabra menu
              ),
              Text('Menú',
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
              AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: controller,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
