part of '_field_controller.dart';

extension Borders on FieldController {
  _getOutlineBorder({double width = 1}) => OutlineInputBorder(
        borderRadius: BorderRadius.circular(1.w),
        borderSide: BorderSide(color: _getColor(), width: width),
      );
}
