import 'package:flutter/material.dart';
import 'colors.dart';

class AppButtonStyle {
  static ButtonStyle elevatedButton(Color backgroundColor) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      fixedSize: const Size(165, 57),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      padding: EdgeInsets.zero,
    );
  }


  static ButtonStyle  outlined(bordercolor,bg)  {

    return OutlinedButton.styleFrom(

  padding: EdgeInsets.symmetric(vertical: 15),
  backgroundColor: bg,
  side: BorderSide(
  color: bordercolor
  )

  );}
}