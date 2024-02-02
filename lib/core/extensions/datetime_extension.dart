import 'package:intl/intl.dart';

/// DateTime extensions
extension DateTimeExtension on DateTime {
  /// Returns [String] for todays date.
  String ddMMyyyy() => DateFormat('d MMM yyyy').format(this);
}
