import 'package:comento_task/application/utils/primary_extension.dart';
import 'package:flutter/material.dart';

import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';

class DetailAnswer extends StatelessWidget {
  final String replyUserName;
  final String contents;
  final String createdAt;

  const DetailAnswer({
    Key? key,
    required this.replyUserName,
    required this.contents,
    required this.createdAt,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        const JDivider(),
        const SizedBox(height: 20),
        Text(
          replyUserName,
          style: textTheme.titleMedium!.copyWith(color: customColors.font2),
        ),
        const SizedBox(height: 10),
        const JDivider(),
        const SizedBox(height: 15),
        Text(
          contents,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        Text(
          createdAt.timeFormat(),
          style: textTheme.bodySmall!
              .copyWith(color: Colors.grey.withOpacity(0.8)),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 15),
        const JDivider(),
      ],
    );
  }
}
