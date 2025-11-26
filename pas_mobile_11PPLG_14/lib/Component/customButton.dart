import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle style;
  final TextStyle labelColor;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 376,
    this.height = 53,
    required this.style,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(
          text,
          style: labelColor,
        ),
      ),
    );
  }
}