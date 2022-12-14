import 'package:futurecoin/core/theme/dimensions.dart';
import 'package:futurecoin/modules/global_widgets/input/label_primary.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/text_styles.dart';

class InputPrimary extends StatefulWidget {
  const InputPrimary(
      {Key? key,
      this.labelRight = "",
      this.labelLeft = "",
      this.placeholder,
      this.fieldMessage = "",
      this.inputType = TextInputType.text,
      this.isObscureText = false,
      this.validator,
      this.textEditingController,
      this.enabled = true,
      this.initialValue,
      required this.focusedColor,
      this.onChanged,
      this.suffix})
      : super(key: key);

  final String labelRight;
  final String labelLeft;
  final String? placeholder;
  final String? initialValue;
  final String fieldMessage;
  final TextInputType inputType;
  final bool isObscureText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? textEditingController;
  final bool enabled;
  final Widget? suffix;
  final Color focusedColor;
  final Function(String)? onChanged;

  @override
  State<InputPrimary> createState() => _InputPrimaryState();
}

class _InputPrimaryState extends State<InputPrimary> {
  double borderRadius = 4;
  double borderWidth = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// LABEL
        if (widget.labelLeft.isNotEmpty || widget.labelRight.isNotEmpty)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// LABEL LEFT
                  if (widget.labelLeft.isNotEmpty)
                    LabelPrimary(label: widget.labelLeft),

                  /// LABEL RIGHT
                  if (widget.labelRight.isNotEmpty)
                    Text(
                      widget.labelRight,
                      style: AppTextStyles.secondaryLabel
                          .copyWith(color: AppColors.textGray_60),
                    ),
                ],
              ),
              SizedBox(
                height: Dimensions.horizontalPadding,
              ),
            ],
          ),

        /// TEXT FIELD
        TextFormField(
          onChanged: widget.onChanged,
          initialValue: widget.initialValue,
          enabled: widget.enabled,
          validator: widget.validator,
          controller: widget.textEditingController,
          obscureText: widget.isObscureText,
          textAlignVertical: TextAlignVertical.center,
          keyboardType: widget.inputType,
          style: AppTextStyles.h5.copyWith(fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            filled: true,
            fillColor: widget.enabled ? AppColors.uiWhite : AppColors.uiGray_30,
            disabledBorder: disabledBorder(),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            hintText: widget.placeholder,
            hintStyle: AppTextStyles.bodyRegular
                .copyWith(color: AppColors.textGray_60),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            border: border(),
            enabledBorder: border(),
            focusedBorder: focusedBorder(),
            suffixIcon: widget.suffix,
          ),
        ),
        if (widget.fieldMessage.isNotEmpty)
          SizedBox(
            height: 8,
          ),
        if (widget.fieldMessage.isNotEmpty)
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: AppColors.uiGray_100,
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Message Text",
                style: AppTextStyles.primaryLabel.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
      ],
    );
  }

  OutlineInputBorder disabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppColors.uiGray_20,
        width: borderWidth,
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: AppColors.uiGray_30,
        width: borderWidth,
      ),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: widget.focusedColor,
        width: borderWidth,
      ),
    );
  }
}
