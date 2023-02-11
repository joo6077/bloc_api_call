import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:flutter/material.dart';

class DetailAnswer extends StatelessWidget {
  const DetailAnswer({super.key});

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
          'reply_user_name',
          style: textTheme.bodyMedium!.copyWith(color: Colors.grey),
        ),
        const SizedBox(height: 10),
        const JDivider(),
        const SizedBox(height: 15),
        Text(
          'contents',
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 15),
        Text(
          'create_at',
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
