import 'package:intl/intl.dart';

class Utils {
  static String formatTime(String time) {
    return "$time ${time == "1" ? 'hora' : 'horas'}";
  }

  static String formatPrice(double price) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(price);
  }
}
