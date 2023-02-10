import 'package:flutter/material.dart';
import 'package:comento_task/application/styles/common.dart';

class JModal extends StatelessWidget {
  final Widget body;

  const JModal({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Container(
      width: s.width,
      height: s.height,
      color: Colors.black54,
      child: Center(
          child: Padding(
        padding: horizontalPadding,
        child: Container(
          color: Colors.white,
          child: body,
        ),
      )),
    );
  }
}
