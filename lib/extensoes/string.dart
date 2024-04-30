import 'package:intl/intl.dart';

extension StringExtensions on String? {
  bool isEmpty() => '$this' == "null" || '$this'.isEmpty;

  bool isNotEmpty() => !isEmpty();

  String getMascaraCpfOuCnpj({prefixoInfo = false}) {
    if (this.isEmpty()) return "";

    switch (this!.length) {
      case 11:
        var aux =
            "${this!.substring(0, 3)}.${this!.substring(3, 6)}.${this!.substring(6, 9)}-${this!.substring(9, 11)}";

        return prefixoInfo ? "CPF: $aux" : aux;
      case 14:
        var aux =
            "${this!.substring(0, 2)}.${this!.substring(2, 5)}.${this!.substring(5, 8)}/${this!.substring(8, 12)}-${this!.substring(12, 14)}";

        return prefixoInfo ? "CNPJ: $aux" : aux;
      default:
        return this!;
    }
  }

  String getMascaraTelefoneOuCelular({prefixoInfo = false}) {
    if (this.isEmpty()) return "";

    switch (this!.length) {
      case 11:
        var aux =
            "(${this!.substring(0, 2)}) ${this!.substring(2, 6)}-${this!.substring(6, 11)}";

        return prefixoInfo ? "CELULAR: $aux" : aux;
      case 10:
        var aux =
            "(${this!.substring(0, 2)}) ${this!.substring(2, 6)}-${this!.substring(6, 10)}";

        return prefixoInfo ? "TELEFONE: $aux" : aux;
      default:
        return this!;
    }
  }

  String getMascaraCep({prefixoInfo = false}) {
    if (this.isEmpty() || this!.length != 8) return "";

    var aux = "${this!.substring(0, 5)}-${this!.substring(5, 8)}";
    return prefixoInfo ? "CEP: $aux" : aux;
  }

  String removerMascaraCpfOuCnpj() {
    if (this.isEmpty()) return "";

    return this!
        .replaceAll(".", "")
        .replaceAll("-", "")
        .replaceAll(",", "")
        .replaceAll("/", "")
        .trim();
  }

  double removerMascaraDinheiro() {
    if (this!.isEmpty) return 0;
    if (!this!.contains(',')) return double.parse(this!);

    Intl.defaultLocale = 'pt_BR';
    try {
      return NumberFormat().parse(this!.replaceAll("R\$", "")).toDouble();
    } on Exception {
      return 0;
    }
  }

  isCpfMaskedLength() => this!.length == 14;
  isCnpjMaskedLength() => this!.length == 18;
  isCepMaskedLength() => this!.length == 9;
  isCepLength() => this!.length == 8;

  String removerMascaraTelefone() {
    if (this.isEmpty()) return "";

    return (this!
            .replaceAll("(", "")
            .replaceAll(")", "")
            .replaceAll("-", "")
            .replaceAll(" ", ""))
        .trim();
  }

  String getTextoComSeparador({required String separador}) {
    if (this.isEmpty()) return "";

    return "${this!}, ";
  }

  String formatarInteiroComPonto() =>
      NumberFormat.decimalPattern('vi_VN').format(int.parse(this!));
}
