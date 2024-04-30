part of '_field_controller.dart';

extension SuffixIcon on FieldController {
  _getSuffixIcon({focusColor = true}) => model.value.suffixIcon == null &&
          _showClearButton().isFalse
      ? null
      : Container(
          padding: EdgeInsets.only(right: 1.w),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildClearButton(focusColor: focusColor),
            _buildSuffixIcon(),
          ]));

  _buildSuffixIcon() =>
      model.value.suffixIcon == null || _showClearButton().isTrue
          ? None()
          : model.value.suffixIcon;
}
