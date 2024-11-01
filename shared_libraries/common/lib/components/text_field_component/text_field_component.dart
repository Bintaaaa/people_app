import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldComponentStyleEnum { initial, rounded }

class TextFieldComponent extends StatelessWidget {
  final TextEditingController? _controller;
  final String _hintText;
  final String _title;
  final int? _maxLength;
  final int? _maxLines;
  final int? _minimalLines;
  final bool _obscureText;
  final Function(String)? _onChange;
  final Function(String)? _onSubmitted;
  final TextFieldComponentStyleEnum _textFieldComponentStyleEnum;
  final TextInputType? _textInputType;
  final List<TextInputFormatter>? _inputFormatter;

  const TextFieldComponent.only({
    super.key,
    required TextEditingController controller,
    required String hintText,
    required String title,
    Function(String)? onChange,
    Function(String)? onSubmitted,
    int? maxLength,
    int? maxLines,
    int? minimalLines,
    TextInputType? textInputType,
    List<TextInputFormatter>? inputFormatters,
    bool? obscureText,
  })  : _controller = controller,
        _hintText = hintText,
        _title = title,
        _onChange = onChange,
        _onSubmitted = onSubmitted,
        _maxLength = maxLength,
        _maxLines = maxLines ?? 1,
        _minimalLines = minimalLines,
        _textFieldComponentStyleEnum = TextFieldComponentStyleEnum.initial,
        _textInputType = textInputType ?? TextInputType.text,
        _inputFormatter = inputFormatters,
        _obscureText = obscureText ?? false;

  const TextFieldComponent.rounded({
    super.key,
    TextEditingController? controller,
    Widget? suffixIcon,
    Widget? prefixIcon,
    required String hintText,
    required String title,
    FocusNode? focusNode,
    int? maxLength,
    int? maxLines,
    int? minimalLines,
    Function(String)? onChange,
    Function(String)? onSubmitted,
    bool? obscureText,
    TextInputType? textInputType,
    List<TextInputFormatter>? inputFormatters,
  })  : _controller = controller,
        _hintText = hintText,
        _title = title,
        _maxLength = maxLength,
        _maxLines = maxLines ?? 1,
        _minimalLines = minimalLines,
        _onChange = onChange,
        _onSubmitted = onSubmitted,
        _textFieldComponentStyleEnum = TextFieldComponentStyleEnum.rounded,
        _textInputType = textInputType ?? TextInputType.text,
        _inputFormatter = inputFormatters,
        _obscureText = obscureText ?? false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        _title,
        style: TextStyleConstants.textFieldTitle,
      ),
      Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(
          minHeight: 60.h,
          maxHeight: _controller?.text.length != null
              ? _controller!.text.length > 50
                  ? 150.h
                  : 60.h
              : 60.h,
        ),
        decoration: _textFieldComponentStyleEnum == TextFieldComponentStyleEnum.rounded
            ? BoxDecoration(
                border: Border.all(
                  color: ConstansValues.colors.blue500,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(
                  8.w,
                ),
              )
            : null,
        padding: _textFieldComponentStyleEnum == TextFieldComponentStyleEnum.rounded ? EdgeInsets.all(8.w) : null,
        child: TextField(
          controller: _controller,
          onChanged: _onChange,
          onSubmitted: _onSubmitted,
          maxLength: _maxLength,
          maxLines: _maxLines,
          minLines: _minimalLines,
          obscureText: _obscureText,
          style: TextStyleConstants.paragraphText,
          keyboardType: _textInputType,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: _hintText,
            hintStyle: TextStyleConstants.hintText,
            enabledBorder: _textFieldComponentStyleEnum == TextFieldComponentStyleEnum.initial
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstansValues.colors.neutral600,
                    ),
                  )
                : null,
            focusedBorder: _textFieldComponentStyleEnum == TextFieldComponentStyleEnum.initial
                ? UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: ConstansValues.colors.neutral700,
                    ),
                  )
                : null,
          ),
          inputFormatters: _inputFormatter,
        ),
      )
    ]);
  }
}
