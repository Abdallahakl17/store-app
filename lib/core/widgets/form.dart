import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 
class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;

  final TextInputType keyboardType;
  final TextInputAction? textInputAction;

  final bool obscureText;
  final bool enabled;
  final bool readOnly;

  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final FocusNode? focusNode;

  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final VoidCallback? onTap;

  final int maxLines;
  final int? maxLength;

  final AutovalidateMode? autovalidateMode;

  final List<TextInputFormatter>? inputFormatters;

  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.onFieldSubmitted,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.maxLength,
    this.autovalidateMode,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      enabled: enabled,
      readOnly: readOnly,
      validator: validator,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLines,
      maxLength: maxLength,
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,

      cursorColor: Theme.of(context).colorScheme.primary,

      style: Theme.of(context).textTheme.labelMedium,

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}