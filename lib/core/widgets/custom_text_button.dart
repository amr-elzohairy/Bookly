import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.bgColor,
    required this.textColor,
    required this.text,
    this.borderRadius,
    this.fontSize,
    this.onPressed,
  });
  final Color bgColor;
  final Color textColor;
  final String text;
  final BorderRadius? borderRadius;
  final double? fontSize;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: bgColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
            )),
        child: Text(
          text,
          style: Style.textStyle18.copyWith(
            fontWeight: FontWeight.w900,
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
