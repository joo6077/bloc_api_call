import 'package:comento_task/application/styles/j_theme.dart';
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
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Container(
      height: 1,
      width: s.width,
      color: color ?? customColors.font3,
    );
  }
}
