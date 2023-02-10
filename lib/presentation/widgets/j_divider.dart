import 'package:flutter/material.dart';

class JDivider extends StatelessWidget {
  const JDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Container(
      height: 1,
      width: s.width,
      color: Colors.grey[350],
    );
  }
}
