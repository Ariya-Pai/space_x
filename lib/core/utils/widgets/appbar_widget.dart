import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:space_x/core/utils/themes/text.dart';
import 'package:space_x/localization/language/bloc/set_languange_bloc.dart';

class AppbarWidget extends StatefulWidget implements PreferredSizeWidget {
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppbarWidget> createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  String _selectedLanguage = "en";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: widget.appBarColors ?? Colors.transparent,
      actions:
          (widget.showIcon == true)
              ? [
                CircleAvatar(radius: 30, child: Text("data")),
                SizedBox(width: 20),
              ]
              : [changeLanguage()],
      title: TextApp(
        text: widget.text,
        fontWeight: widget.fontWeight,
        fonzSize: widget.fonzSize,
        textAlign: widget.textAlign,
        textColor: widget.textColor,
      ),
    );
  }

  Widget changeLanguage() {
    return SizedBox(
      width: 80,
      child: DropdownButton<String>(
        value: _selectedLanguage,
        items: [
          DropdownMenuItem(value: 'en', child: Text('EN')),
          DropdownMenuItem(value: 'th', child: Text('TH')),
        ],
        onChanged: (value) {
          Modular.get<SetLanguangeBloc>().add(
            SetLanguage(language: value ?? ""),
          );
          setState(() {
            _selectedLanguage = value!;
          });
        },
      ),
    );
  }
}
