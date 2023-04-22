import 'package:bloc_api_call/application/styles/common.dart';
import 'package:bloc_api_call/application/utils/primary_extension.dart';
import 'package:bloc_api_call/presentation/widgets/shimmer.dart';
import 'package:bloc_api_call/presentation/widgets/shimmer_widget.dart';
import 'package:flutter/material.dart';

import 'package:bloc_api_call/application/const/variables.dart';
import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/presentation/widgets/j_divider.dart';

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
          style: textTheme.titleSmall!.copyWith(color: customColors.font4),
        ),
        const SizedBox(height: 15),
        JDivider(color: customColors.primary),
        const SizedBox(height: 20),
        Text(
          '$TEXT_ANSWER $replyCount',
          style: textTheme.titleMedium!.copyWith(color: customColors.font1),
        ),
      ],
    );
  }
}

class DetailHeaderShimmer extends StatelessWidget {
  const DetailHeaderShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Padding(
      padding: horizontalPadding,
      child: Shimmer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            JDivider(color: customColors.primary),
            const SizedBox(height: 20),
            const ShimmerWidget.rectangular(height: 20),
            const SizedBox(height: 5),
            const ShimmerWidget.rectangular(height: 20),
            const SizedBox(height: 5),
            const ShimmerWidget.rectangular(height: 20),
            const SizedBox(height: 15),
            const ShimmerWidget.rectangular(height: 18),
            const SizedBox(height: 5),
            const ShimmerWidget.rectangular(height: 18),
            const SizedBox(height: 5),
            const ShimmerWidget.rectangular(height: 18),
            const SizedBox(height: 15),
            const ShimmerWidget.rectangular(height: 16, width: 100),
            const SizedBox(height: 20),
            JDivider(color: customColors.primary),
            const SizedBox(height: 20),
            const ShimmerWidget.rectangular(height: 18, width: 50),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
