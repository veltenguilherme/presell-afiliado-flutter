part of '_field_controller.dart';

extension PrefixIcon on FieldController {
  _getPrefixIcon() => Container(
      padding: EdgeInsets.only(right: 1.w),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        _buildRequiredField(),
        _buildPrefixIcon(),
      ]));

  _buildRequiredField() => model.value.required && model.value.showRequiredIcon
      ? SvgPicture.asset(
          imagens.requiredSvg,
          width: model.value.iconSize.w,
          height: model.value.iconSize.w,
          // ignore: deprecated_member_use
          color: tema.vermelho,
        )
      : const None();

  _buildPrefixIcon() => model.value.prefixIconSvg != null
      ? SvgPicture.asset(
          model.value.prefixIconSvg!,
          // ignore: deprecated_member_use
          color: _getColor(),
          width: model.value.iconSize.w,
          height: model.value.iconSize.w,
        )
      : Icon(
          model.value.prefixIcon,
          color: _getColor(),
          size: model.value.iconSize.w,
        );
}
