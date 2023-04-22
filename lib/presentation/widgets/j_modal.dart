import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:flutter/material.dart';
import 'package:bloc_api_call/application/styles/common.dart';

class JModal extends StatelessWidget {
  final Widget body;

  const JModal({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final s = MediaQuery.of(context).size;

    return Container(
      width: s.width,
      height: s.height,
      color: Colors.black54,
      child: Center(
          child: Padding(
        padding: horizontalPadding,
        child: Container(
          color: customColors.surface,
          child: body,
        ),
      )),
    );
  }
}
