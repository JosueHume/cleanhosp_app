import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginLabel extends StatelessWidget {
  final String titulo;
  final TextAlign? textAlign;
  LoginLabel(this.titulo, {this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      textAlign: textAlign,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
