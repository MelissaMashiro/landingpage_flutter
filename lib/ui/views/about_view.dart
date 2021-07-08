import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text('About View',
            style: GoogleFonts.montserratAlternates(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
