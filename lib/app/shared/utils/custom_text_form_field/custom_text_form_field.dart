import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final String hint;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final Function(String)? onSubmited;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final bool needTheSpace;
  final Color? borderColor;
  final Color? errorColor;
  final Color? cursorColor;
  final Color? textColor;
  final Color? fillColor;
  final Color? hintColor;
  final bool? isHint;
  final int? maxLine;
  final int? minLine;
  final String? Function(String?)? validator;
  final bool? enabled;
  final BorderRadius? borderRadius;
  final double? textSize;
  final bool? isCapitalizationCharacters;

  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.prefixIcon,
      this.validator,
      required this.hint,
      this.suffixIcon,
      required this.obscureText,
      this.inputFormatters,
      this.initialValue,
      this.onChanged,
      this.onSubmited,
      this.borderColor,
      this.cursorColor,
      this.fillColor,
      this.textColor,
      this.hintColor,
      this.isHint,
      required this.needTheSpace,
      this.keyboardType,
      this.focusNode,
      this.maxLine,
      this.minLine,
      this.enabled,
      this.borderRadius,
      this.textSize,
      this.isCapitalizationCharacters,
      this.errorColor})
      : super(key: key);
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  ConstStyle constStyle = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.needTheSpace ? 10 : 0,
        ),
        TextFormField(
          controller: widget.controller,
          textCapitalization: widget.isCapitalizationCharacters == true
              ? TextCapitalization.characters
              : TextCapitalization.sentences,
          enabled: widget.enabled,
          initialValue: widget.initialValue,
          validator: widget.validator,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: widget.onSubmited,
          onChanged: widget.onChanged,
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLine ?? 1,
          cursorColor: widget.cursorColor ?? constStyle.secundaryColor,
          style: TextStyle(
              color: widget.textColor ?? widget.textColor ?? Colors.white),
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
              filled: widget.fillColor != null ? true : false,
              fillColor: widget.fillColor,
              enabledBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: widget.borderColor ?? constStyle.secundaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: widget.borderColor ?? constStyle.secundaryColor)),
              errorBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: widget.errorColor ?? Colors.red)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide:
                      BorderSide(color: widget.errorColor ?? Colors.red)),
              errorStyle: TextStyle(
                  color: widget.errorColor ?? Colors.red,
                  fontSize: widget.textSize),
              isDense: true,
              labelText: widget.isHint == true ? null : widget.hint,
              hintText: widget.isHint == true ? widget.hint : null,
              hintStyle: TextStyle(
                  color: widget.hintColor ?? Colors.grey,
                  fontSize: widget.textSize),
              labelStyle: TextStyle(
                  color: widget.hintColor ?? Colors.grey,
                  fontSize: widget.textSize),
              border: OutlineInputBorder(
                  borderRadius: widget.borderRadius ?? BorderRadius.circular(5),
                  borderSide: BorderSide(
                      color: widget.borderColor ?? constStyle.secundaryColor)),
              prefixIcon: widget.prefixIcon,
              suffixIcon: widget.suffixIcon),
        )
      ],
    );
  }
}
