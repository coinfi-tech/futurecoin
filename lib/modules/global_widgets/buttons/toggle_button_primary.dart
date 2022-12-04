import 'package:coinfi/core/theme/colors.dart';
import 'package:coinfi/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ToggleButtonPrimary extends StatelessWidget {
  const ToggleButtonPrimary(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.selectionColor,
      required this.onPressed})
      : super(key: key);

  final String text;
  final bool isSelected;
  final Color selectionColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? selectionColor : AppColors.uiGray_40),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(
          text,
          style: AppTextStyles.bodyRegular.copyWith(
              color: isSelected ? selectionColor : AppColors.uiGray_80),
        ),
      ),
    );
  }
}