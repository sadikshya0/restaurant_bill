import 'package:flutter/material.dart';
import 'package:restaurant_bill/utils/custom_text_styles.dart';
import '../../utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final IconData? preIconPath;
  final IconData? suffixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: (readOnly == null) ? false : readOnly!,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: 1,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText ?? "",
                style: CustomTextStyles.f16W400(color: AppColors.primaryColor),
              )
            : null,
        fillColor: fillColor ?? Colors.transparent,
        filled: fillColor != null,
        prefixIcon: (preIconPath != null)
            ? Icon(
                preIconPath,
                size: 20,
                color: isDark
                    ? AppColors.primaryColor
                    : AppColors.secondaryTextColor,
              )
            : null,
        suffixIcon: (suffixIconPath != null)
            ? Icon(
                suffixIconPath,
                size: 22,
                color: isDark
                    ? AppColors.whiteColor
                    : AppColors.backGroundDark.withOpacity(0.5),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.backGroundDark.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.errorColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: border ?? AppColors.errorColor,
          ),
        ),
        errorStyle: (showError!)
            ? const TextStyle(fontSize: 12)
            : const TextStyle(fontSize: 0),
        hintText: hint,
        hintStyle: CustomTextStyles.f14W400(
          color: AppColors.secondaryTextColor,
        ),
      ),
      style: CustomTextStyles.f14W400(
        color: (readOnly ?? false)
            ? isDark
                  ? AppColors.whiteColor
                  : AppColors.backGroundDark
            : null,
      ),
    );
  }
}
