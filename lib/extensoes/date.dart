import 'package:intl/intl.dart';

extension DoubleExtensions on DateTime {
  String formatar({format}) => DateFormat(format ?? 'dd/MM/yyyy').format(this);
}
