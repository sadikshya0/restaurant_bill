import 'package:restaurant_bill/utils/custom_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:restaurant_bill/utils/validator.dart';

import '../../utils/colors.dart';
import '../../utils/image_path.dart';

class CustomPasswordField extends StatelessWidget {
  final String hint;
  final FocusNode? focusNode;
  final bool eye;
  final VoidCallback onEyeClick;
  final IconData? preIconPath;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final String? labelText;

  const CustomPasswordField({
    super.key,
    required this.hint,
    required this.eye,
    required this.onEyeClick,
    required this.controller,
    required this.textInputAction,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.labelText,
    this.preIconPath,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      validator: validator ?? Validators.checkPasswordField,
      obscureText: eye,
      maxLines: 1,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText ?? "",
                style: CustomTextStyles.f16W400(color: AppColors.primaryColor),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: AppColors.backGroundDark.withOpacity(0.4),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.errorColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.errorColor),
        ),
        prefixIcon: (preIconPath != null)
            ? Icon(preIconPath, size: 20, color: AppColors.secondaryColor)
            : null,
        suffixIcon: IconButton(
          onPressed: onEyeClick,
          icon: (eye)
              ? SvgPicture.asset(
                  ImagePath.eyeOff,
                  height: 16,
                  colorFilter: const ColorFilter.mode(
                    AppColors.backGroundDark,
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  ImagePath.eye,
                  height: 12,
                  colorFilter: ColorFilter.mode(
                    AppColors.backGroundDark.withOpacity(0.5),
                    BlendMode.srcIn,
                  ),
                  fit: BoxFit.scaleDown,
                ),
        ),
        errorStyle: const TextStyle(fontSize: 12),
        hintText: hint,
        hintStyle: CustomTextStyles.f14W400(
          color: AppColors.secondaryTextColor,
        ),
      ),
      style: CustomTextStyles.f14W400(color: AppColors.backGroundDark),
    );
  }
}
