import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

enum ButtonComponentStyleEnum { primary, secondary, disabled, custom }

enum ButtonComponentTypeEnum { icon, noIcon }

class ButtonComponent extends StatelessWidget {
  const ButtonComponent.primary({
    super.key,
    required String title,
    required Function() onPress,
    bool? isDisable,
    bool? isLoading,
    double? width,
  })  : _title = title,
        _onPress = onPress,
        _isDisable = isDisable ?? false,
        _buttonStyleEnum = ButtonComponentStyleEnum.primary,
        _buttonTypeEnum = ButtonComponentTypeEnum.noIcon,
        _prefixIcon = null,
        _isLoading = isLoading ?? false,
        _buttonColor = null,
        _textStyle = null,
        _width = width;

  const ButtonComponent.secondary({
    super.key,
    required String title,
    required Function() onPress,
    bool? isDisable,
    bool? isLoading,
    double? width,
  })  : _title = title,
        _onPress = onPress,
        _isDisable = isDisable ?? false,
        _buttonStyleEnum = ButtonComponentStyleEnum.secondary,
        _buttonTypeEnum = ButtonComponentTypeEnum.noIcon,
        _prefixIcon = null,
        _isLoading = isLoading ?? false,
        _buttonColor = null,
        _textStyle = null,
        _width = width;

  const ButtonComponent.custom({
    super.key,
    required String title,
    required Function() onPress,
    bool? isDisable,
    bool? isLoading,
    required Color color,
    required TextStyle textStyle,
    double? width,
  })  : _title = title,
        _onPress = onPress,
        _isDisable = isDisable ?? false,
        _buttonStyleEnum = ButtonComponentStyleEnum.custom,
        _buttonTypeEnum = ButtonComponentTypeEnum.noIcon,
        _prefixIcon = null,
        _isLoading = isLoading ?? false,
        _buttonColor = color,
        _textStyle = textStyle,
        _width = width;

  const ButtonComponent.primaryWithIcon({
    super.key,
    required String title,
    required Function() onPress,
    bool? isDisable,
    required Widget? prefixIcon,
    bool? isLoading,
    double? width,
  })  : _title = title,
        _onPress = onPress,
        _isDisable = isDisable ?? false,
        _prefixIcon = prefixIcon,
        _buttonStyleEnum = ButtonComponentStyleEnum.primary,
        _buttonTypeEnum = ButtonComponentTypeEnum.icon,
        _isLoading = isLoading ?? false,
        _buttonColor = null,
        _textStyle = null,
        _width = width;

  const ButtonComponent.secondaryWithIcon({
    super.key,
    required String title,
    required Function() onPress,
    bool? isDisable,
    required Widget? prefixIcon,
    bool? isLoading,
    double? width,
  })  : _title = title,
        _onPress = onPress,
        _isDisable = isDisable ?? false,
        _prefixIcon = prefixIcon,
        _buttonStyleEnum = ButtonComponentStyleEnum.secondary,
        _buttonTypeEnum = ButtonComponentTypeEnum.icon,
        _isLoading = isLoading ?? false,
        _buttonColor = null,
        _textStyle = null,
        _width = width;

  final String _title;
  final Function() _onPress;
  final bool _isDisable;
  final ButtonComponentStyleEnum _buttonStyleEnum;
  final ButtonComponentTypeEnum _buttonTypeEnum;
  final Widget? _prefixIcon;
  final bool _isLoading;
  final double? _width;
  final Color? _buttonColor;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? double.infinity,
      height: 58.h,
      child: ElevatedButton(
        onPressed: _isDisable ? null : _onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 0,
          foregroundColor: _foregroundColor(),
          backgroundColor: _backgroundColor(),
        ),
        child: _childType(),
      ),
    );
  }

  Color _backgroundColor() {
    if (_isDisable) {
      return ConstansValues.colors.neutral600;
    }
    switch (_buttonStyleEnum) {
      case ButtonComponentStyleEnum.primary:
        return ConstansValues.colors.primaryBlue;
      case ButtonComponentStyleEnum.secondary:
        return ConstansValues.colors.buttonBlue;
      case ButtonComponentStyleEnum.custom:
        return _buttonColor!;
      default:
        return ConstansValues.colors.buttonPink;
    }
  }

  Color _foregroundColor() {
    if (_isDisable) {
      return ConstansValues.colors.neutral600;
    }
    switch (_buttonStyleEnum) {
      case ButtonComponentStyleEnum.primary:
        return ConstansValues.colors.blue500;
      case ButtonComponentStyleEnum.secondary:
        return ConstansValues.colors.primaryBlue;
      case ButtonComponentStyleEnum.custom:
        return ConstansValues.colors.neutral200;
      default:
        return ConstansValues.colors.primaryPink;
    }
  }

  Widget _childType() {
    if (_isLoading) {
      return CircularProgressIndicator(
        strokeWidth: 3.0,
        color: ConstansValues.colors.white,
      );
    }
    switch (_buttonTypeEnum) {
      case ButtonComponentTypeEnum.noIcon:
        return Text(
          _title,
          style: _textStyle ??
              TextStyleConstants.button.copyWith(
                color: ConstansValues.colors.white,
              ),
        );
      case ButtonComponentTypeEnum.icon:
        return Row(
          children: [
            _prefixIcon ?? const SizedBox(),
            Expanded(
              child: Text(
                _title,
                style: TextStyleConstants.button.copyWith(
                  color: ConstansValues.colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
    }
  }
}
