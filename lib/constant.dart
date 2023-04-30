import 'package:flutter/material.dart';

ButtonStyle kStyle(BuildContext context, Color bgColor) {
  return ElevatedButton.styleFrom(
      primary: bgColor,
      fixedSize: Size(MediaQuery.of(context).size.width * 0.5, 50),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ));
}
