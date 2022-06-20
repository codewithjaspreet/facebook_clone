import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  CircleButton(
      {required this.onPressed, required this.icon, required this.iconSize});
  final IconData icon;
  final double iconSize;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon),
        iconSize: iconSize,
        color: Colors.black,
      ),
    );
  }
}
