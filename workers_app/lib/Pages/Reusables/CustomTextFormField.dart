import 'package:flutter/material.dart';
import 'package:workers_app/Helpers/ResponsiveUI.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final TextStyle style;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color enabledfocusedBorder;
  final Color? filledColor;
  final Color borderColor;
  final double borderRadius;
  final bool? visibility;
  final TextInputType? keyboardType;
  final int? maxLines; // Supports dynamic expansion
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final FocusNode node;

  const CustomTextFormField({
    super.key,
    required this.borderColor,
    required this.borderRadius,
    required this.hintText,
    required this.style,
    required this.enabledfocusedBorder,
    this.controller,
    required this.node,
    this.filledColor,
    this.visibility,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.keyboardType = TextInputType.multiline,
    this.maxLines, // Allow auto-expansion
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) {
        if (onChanged != null) {
          onChanged!(value);
        }
      },
      obscureText: visibility ?? false,
      controller: controller,
      focusNode: node,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1, // Set to null for auto-expansion
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: style,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(
            color: enabledfocusedBorder,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius.r(context)),
          borderSide: BorderSide(
            color: enabledfocusedBorder,
          ),
        ),
      ),
    );
  }
}
