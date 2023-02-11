import 'package:comento_task/application/styles/common.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/detail/widgets/detail_answer.dart';
import 'package:comento_task/presentation/detail/widgets/detail_header.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: horizontalPadding,
          children: [
            DetailHeader(),
            DetailAnswer(),
            DetailAnswer(),
          ],
        ),
      ),
    );
  }
}
