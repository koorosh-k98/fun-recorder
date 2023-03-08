import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final Widget child;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.color,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          shape: BoxShape.rectangle,
          color: color,
        ),
        child: child,
      ),
    );
  }
}
