import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingView extends StatelessWidget {
  const PricingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Text('Pricing View',
            style: GoogleFonts.montserratAlternates(
                fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
