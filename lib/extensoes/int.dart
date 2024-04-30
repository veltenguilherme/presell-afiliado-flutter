import 'package:intl/intl.dart';

extension IntExtensions on int {
  String formatarComPonto() =>
      NumberFormat.decimalPattern('vi_VN').format(this);
}
