import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

/// This widget creates a [ElevatedButton] or and [ElevatedButton.icon] based on whether an icon is provider or it is null
/// [btnText] text to be displayed on the button
/// [btnRadius] radius of the button
/// [btnColor] color of the button
/// [btnWidth] width of the button
/// [btnHeight] height of the button
/// [icon] icon which needs to be added to the button
/// [btnBorder] border config for the button
class CustomButton extends StatelessWidget {
  final String btnText;
  final double btnRadius;
  final Color btnColor;
  final double btnWidth;
  final double btnHeight;
  final ButtonShape shape;
  final Widget? icon;
  final BorderSide? btnBorder;
  final VoidCallback? onPressed;
  final Color textColor;
  final double btnElevation;

  const CustomButton({
    super.key,
    required this.btnText,
    this.btnRadius = 20,
    this.btnColor = AppColors.primaryColor,
    this.btnWidth = 200,
    this.icon,
    this.shape = ButtonShape.continuousRectangleBorder,
    this.btnHeight = 50,
    this.btnBorder,
    this.onPressed,
    this.textColor = Colors.white,
    this.btnElevation = 5
  });

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        minimumSize: getMinimumSize(btnWidth, btnHeight),
        backgroundColor: onPressed != null
            ? WidgetStateProperty.all(btnColor)
            : WidgetStateProperty.all(Colors.grey),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          buildBorder(btnRadius, shape),
        ),
        elevation: WidgetStateProperty.all(btnElevation),
        side: WidgetStateProperty.all(btnBorder),
      ),
      label: Text(
        btnText,
        style: TextStyle(fontSize: 20, color: textColor),
      ),
      icon: (icon == null) ? null : icon,
    );
  }

  WidgetStateProperty<Size?> getMinimumSize(final btnWidth, final btnHeight) {
    if (btnWidth != null && btnWidth != null) {
      return WidgetStateProperty.all(Size(btnWidth, btnHeight));
    } else if (btnWidth != null) {
      return WidgetStateProperty.all(Size.fromWidth(btnWidth));
    } else if (btnHeight != null) {
      return WidgetStateProperty.all(Size.fromHeight(btnHeight));
    } else {
      return WidgetStateProperty.all(null);
    }
  }

  OutlinedBorder buildBorder(final double btnRadius, final ButtonShape shape) {
    if (ButtonShape.continuousRectangleBorder == shape) {
      return ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      );
    } else if (ButtonShape.roundedRectangle == shape) {
      return RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(btnRadius),
      );
    } else {
      throw UnsupportedError("Shape is not supported yet.");
    }
  }
}

enum ButtonShape {
  roundedRectangle,
  continuousRectangleBorder,
}
