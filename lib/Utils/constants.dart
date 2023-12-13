import 'package:flutter/material.dart';
import 'package:general_counsel/Utils/colors.dart';

var linearGradient = LinearGradient(colors: [
  ColorTheme.primaryColor.withOpacity(.8),
  ColorTheme.primaryColor.withOpacity(.96),
  ColorTheme.primaryColor,
], begin: Alignment.topCenter, end: Alignment.bottomCenter);

///Title labels for textfiels
Padding titlePlaceHolder(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, bottom: 5),
    child: Text(
      title,
      style: const TextStyle(fontFamily: "Cairo"),
    ),
  );
}
