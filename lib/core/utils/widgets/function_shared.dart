import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:space_x/core/utils/themes/color.dart';

class FunctionShared {
  static String dataFomat(DateTime? dataDate) {
    if (dataDate == null) return "";
    String formatted = DateFormat("MMM, dd yyyy' 'HH:mm").format(dataDate);
    return formatted;
  }

  static Widget textSpand({String? title, String? description}) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(fontSize: 16, height: 1.4),
        children: [
          TextSpan(
            text: "$title: ",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: description ?? "-",
            style: TextStyle(color: AppColorsWidget.textGrey),
          ),
        ],
      ),
    );
  }
}
