import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/core/extensions/context_config.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.focusNode,
      this.hintText,
      this.labelText,
      this.initialValue,
      this.keyboardType = TextInputType.text,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.obscureText = false,
      this.enabled = true,
      this.readOnly = false,
      this.autofocus = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.onSaved,
      this.onFieldSubmitted,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines = 1,
      this.minLines,
      this.maxLength,
      this.enableSuggestions = true,
      this.inputFormatters,
      this.autovalidateMode,
      this.autofillHints,
      this.autocorrect = true,
      this.onEditingComplete});

  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final bool enableSuggestions;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;

  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final int maxLines;
  final int? minLines;
  final int? maxLength;

  final Iterable<String>? autofillHints;

  final List<TextInputFormatter>? inputFormatters;

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final AutovalidateMode? autovalidateMode;
  final bool autocorrect;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      initialValue: controller == null ? initialValue : null,
      focusNode: focusNode,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autocorrect: autocorrect,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      onEditingComplete: onEditingComplete,
      obscureText: obscureText,
      enabled: enabled,
      enableSuggestions: enableSuggestions,
      scrollPadding: const EdgeInsets.all(20),
      readOnly: readOnly,
      autofocus: autofocus,
      maxLines: obscureText ? 1 : maxLines,
      minLines: minLines,
      maxLength: maxLength,
      autofillHints: autofillHints,
      inputFormatters: inputFormatters,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      cursorColor: context.colorScheme.primary,
      style: context.textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        counterText: '',
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }
}
