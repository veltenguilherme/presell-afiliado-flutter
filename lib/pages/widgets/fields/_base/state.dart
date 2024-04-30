part of '_field_controller.dart';

extension FieldState on FieldController {
  static setErrorState(field, {Validacao? validacao}) {
    FocusManager.instance.primaryFocus?.unfocus();
    field.value.valid = false;
    field.refresh();

    if (validacao != null) {
      validacao.valido = false;
      validacao.tabIndex = field.value.tabIndex ?? -1;
    }
  }

  static removeErrorState(campo, {Validacao? validacao}) {
    campo.value.clear();
    campo.refresh();

    if (validacao != null) {
      validacao.valido = true;
      validacao.tabIndex = -1;
    }
  }

  static selecionarTexto(campo) {
    campo.value.focusNode.requestFocus();
    campo.value.controller.selection = TextSelection(
        baseOffset: 0, extentOffset: campo.value.controller.value.text.length);
  }

  static setReadOnly(campo, bool readOnly) {
    if (campo == null) return;

    campo.value.readOnly = readOnly;
    campo.refresh();
  }
}

class Validacao {
  bool valido;
  int tabIndex;

  Validacao({
    this.valido = true,
    this.tabIndex = -1,
  });
}
