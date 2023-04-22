import 'package:bloc_api_call/application/styles/common.dart';
import 'package:bloc_api_call/application/utils/primary_extension.dart';
import 'package:bloc_api_call/presentation/widgets/shimmer.dart';
import 'package:bloc_api_call/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/presentation/widgets/j_divider.dart';

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

class DetailAnswerShimmer extends StatelessWidget {
  const DetailAnswerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: horizontalPadding,
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            JDivider(),
            SizedBox(height: 20),
            ShimmerWidget.rectangular(height: 16, width: 150),
            SizedBox(height: 10),
            JDivider(),
            SizedBox(height: 20),
            ShimmerWidget.rectangular(height: 16),
            SizedBox(height: 5),
            ShimmerWidget.rectangular(height: 16),
            SizedBox(height: 5),
            ShimmerWidget.rectangular(height: 16),
            SizedBox(height: 15),
            ShimmerWidget.rectangular(height: 16, width: 100),
            SizedBox(height: 15),
            JDivider(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
