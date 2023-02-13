import 'package:comento_task/application/styles/j_theme.dart';
import 'package:flutter/material.dart';

import 'package:comento_task/application/styles/common.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String id;
  final String userId;
  final String title;
  final String content;
  final Function onTap;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTap(),
              child: Padding(
                padding: horizontalPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: textTheme.titleSmall!,
                        ),
                        Text(
                          id,
                          style: textTheme.titleSmall!
                              .copyWith(color: customColors.font4),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const JDivider(),
                    const SizedBox(height: 15),
                    Text(
                      userId,
                      style: textTheme.titleSmall!
                          .copyWith(color: customColors.font1),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      title,
                      style: textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      content,
                      style: textTheme.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
