import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback onTap;
  final IconData icon;
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey[100],
      ),
      child: InkWell(
        onTap: onTap,
        child: Icon(icon, color: Theme.of(context).primaryColor),
      ),
    );
    ;
  }
}
