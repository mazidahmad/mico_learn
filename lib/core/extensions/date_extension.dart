import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String toFormattedDate() {
    var format = DateFormat('dd MMMM yyyy (HH:mm)');
    return format.format(this);
  }
}
