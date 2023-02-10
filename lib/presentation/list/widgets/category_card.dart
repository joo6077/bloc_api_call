import 'package:comento_task/application/styles/common.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String id;
  final String userId;
  final String title;
  final String content;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.id,
    required this.userId,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      color: Colors.white,
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
                  style: textTheme.titleMedium,
                ),
                Text(
                  id,
                  style: textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const JDivider(),
            const SizedBox(height: 15),
            Text(
              userId,
              style: textTheme.bodyMedium,
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Text(
              content,
              style: textTheme.bodyLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
