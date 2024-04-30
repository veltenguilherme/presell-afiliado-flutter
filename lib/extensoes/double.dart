import 'package:intl/intl.dart';

extension DoubleExtensions on double {
  String formatarDinheiro({removerCifrao = false, decimalDigits = 2}) {
    var resultado = NumberFormat.simpleCurrency(
            locale: "pt_BR", decimalDigits: decimalDigits)
        .format(this);

    if (removerCifrao) resultado = resultado.replaceAll("R\$", "").trim();

    return resultado;
  }

  String formatarComPonto() =>
      NumberFormat.decimalPattern('vi_VN').format(this);
}
