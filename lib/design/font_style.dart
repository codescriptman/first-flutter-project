import 'package:first/design/colors.dart';
import 'package:flutter/material.dart';

TextStyle todoItemStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.w500,
  color: Colors.black87,
  letterSpacing: 1.0,
  height: 1.5,
);
TextStyle appBarTitleStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  letterSpacing: 1.2,
  shadows: [
    Shadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 3.0,
      color: AppColors().accentColor,
    ),
  ],
);
