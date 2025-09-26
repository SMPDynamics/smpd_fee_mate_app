import 'package:flutter/material.dart';

/// A customizable `TextButton` widget with configurable text and text color.
class CustomTextButton extends StatelessWidget {
  final String btnText;
  final Color btnTextColor;
  final VoidCallback? onPressed;

  const CustomTextButton({
    super.key,
    required this.btnTextColor,
    required this.btnText,
    this.onPressed,
  });

  @override
  Widget build(final BuildContext context) {
    return TextButton(
      onPressed: onPressed?? () {},
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all(
          btnTextColor,
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
        overlayColor: WidgetStateProperty.all(Colors.transparent),
      ),
      child: Text(btnText),
    );
  }
}
