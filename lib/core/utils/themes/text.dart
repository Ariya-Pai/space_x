import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fonzSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TextApp({
    super.key,
    required this.text,
    this.textColor,
    this.fonzSize,
    this.fontWeight,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.black,
        fontSize: fonzSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
      ),
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
