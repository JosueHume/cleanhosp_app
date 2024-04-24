import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginLabel extends StatelessWidget {
  final String titulo;

  LoginLabel(this.titulo);

  @override
  Widget build(BuildContext context) {
    return Text(
      titulo,
      style: GoogleFonts.inter(
        color: Colors.white,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}