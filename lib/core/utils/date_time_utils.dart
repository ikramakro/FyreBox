import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

const String dateTimeFormatPattern = 'yyyy-MM-dd';

extension DateTimeExtension on DateTime {
  /// Return a string representing [date] formatted according to our locale
  String format({
    String pattern = dateTimeFormatPattern,
    String? locale,
  }) {
    if (locale != null && locale.isNotEmpty) {
      initializeDateFormatting(locale);
    }
    return DateFormat(pattern, locale).format(this);
  }
}

String unixDateFormatting({required String unixtime}) {
  var millis = int.parse(unixtime);
  var dt = DateTime.fromMillisecondsSinceEpoch(millis * 1000);

// 12 Hour format:
  var d12 = DateFormat('MM/dd/yyyy').format(dt); // 12/31/2000, 10:00 PM

// 24 Hour format:
  // var d24 = DateFormat('dd/MM/yyyy, HH:mm').format(dt);
  return d12;
}
