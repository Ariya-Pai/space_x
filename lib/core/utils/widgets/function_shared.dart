import 'package:intl/intl.dart';

class FunctionShared {
  static String dataFomat(DateTime? dataDate) {
    if (dataDate == null) return "";
    String formatted = DateFormat("MMM, dd yyyy' 'HH:mm").format(dataDate);
    return formatted;
  }
}
