import 'package:flutter/material.dart';

class JButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? labelColor;

  const JButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(3)),
              border: Border.all(color: borderColor ?? Colors.grey[350]!),
            ),
            child: Text(
              label,
              style: TextStyle(color: labelColor ?? Colors.grey[700]!),
            ),
          ),
        ),
      ),
    );
  }
}
