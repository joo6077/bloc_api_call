import 'package:flutter/material.dart';

class JDivider extends StatelessWidget {
  final Color? color;

  const JDivider({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Container(
      height: 1,
      width: s.width,
      color: color ?? Colors.grey[350],
    );
  }
}
