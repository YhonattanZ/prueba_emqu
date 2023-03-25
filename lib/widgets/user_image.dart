import 'dart:io';

import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  UserImage({Key? key, required this.file}) : super(key: key);

  File? file;
  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
        translation: const Offset(0.0, -0.50),
        child: Align(
          child: CircleAvatar(
            backgroundColor: Colors.pink,
            radius: 70.0,
            child: CircleAvatar(
              radius: 65,
              backgroundColor: Colors.white,
              backgroundImage: Image.file(file!).image,
            ),
          ),
        ));
  }
}
