import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Commoncolor.dart';

class Commonbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
   Commonbutton({
     Key? key,
     required this.text,
     required this.onPressed,
     required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenwidth*0.4,
      // height: 48.h,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: screenwidth*0.04,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
            backgroundColor: Appcolor.Buttoncolor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
