import 'package:flutter/material.dart';
import 'package:space_x/core/utils/themes/text.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final Color? textColor;
  final double? fonzSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final Color? appBarColors;
  final bool? showIcon;
  const AppbarWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fonzSize,
    this.fontWeight,
    this.textAlign,
    this.appBarColors,
    this.showIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: appBarColors ?? Colors.transparent,
      actions:
          (showIcon == true)
              ? [
                CircleAvatar(radius: 30, child: Text("data")),
                SizedBox(width: 20),
              ]
              : null,
      title: TextApp(
        text: text,
        fontWeight: fontWeight,
        fonzSize: fonzSize,
        textAlign: textAlign,
        textColor: textColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
