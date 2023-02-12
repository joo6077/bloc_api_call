import 'package:comento_task/application/utils/primary_extension.dart';
import 'package:flutter/material.dart';

import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';

class DetailHeader extends StatelessWidget {
  final String title;
  final String content;
  final String createdAt;
  final String replyCount;

  const DetailHeader({
    Key? key,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.replyCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        JDivider(color: customColors.primary),
        const SizedBox(height: 20),
        Text(
          title,
          style: textTheme.titleLarge,
        ),
        const SizedBox(height: 15),
        Text(
          content,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        Text(
          createdAt.timeFormat(),
          style: textTheme.titleSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 15),
        JDivider(color: customColors.primary),
        const SizedBox(height: 20),
        Text(
          '$TEXT_ANSWER $replyCount',
          style: textTheme.titleMedium!.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
