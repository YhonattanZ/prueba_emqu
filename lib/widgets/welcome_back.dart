import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBack extends StatelessWidget {
  WelcomeBack({Key? key, required this.title, required this.subtitle})
      : super(key: key);
  String? title;
  String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toString(),
            style: GoogleFonts.lato(fontSize: 26, color: Colors.pink),
          ),
          Text(subtitle.toString(),
              style: GoogleFonts.lato(fontSize: 18, color: Colors.grey))
        ],
      ),
    );
  }
}
