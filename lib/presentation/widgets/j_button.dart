import 'package:flutter/material.dart';

class JButton extends StatelessWidget {
  final String label;
  final Function onTap;
  final EdgeInsets? padding;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? fontColor;

  const JButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
    this.fontSize,
    this.backgroundColor,
    this.borderColor,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          onTap: () => onTap(),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: borderColor ?? Colors.grey[350]!),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: fontColor ?? Colors.grey[700]!,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
