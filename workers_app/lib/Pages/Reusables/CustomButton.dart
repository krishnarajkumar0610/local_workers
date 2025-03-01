import 'package:flutter/material.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';

class CustomButton extends StatelessWidget {
  double height;
  double width;
  double borderRadius;
  Color? buttonColor;
  Widget buttonText;

  CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.buttonText,
    required this.borderRadius,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width.w(context),
      height: height.h(context),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          borderRadius.r(context),
        ),
        color: buttonColor,
      ),
      child: buttonText,
    );
  }
}
