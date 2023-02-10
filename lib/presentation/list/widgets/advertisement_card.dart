import 'package:flutter/material.dart';

import 'package:comento_task/application/styles/common.dart';

class AdvertisementCard extends StatelessWidget {
  final String name;
  final String title;
  final String content;
  final String imageUrl;

  const AdvertisementCard({
    Key? key,
    required this.name,
    required this.title,
    required this.content,
    required this.imageUrl,
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
                  style: textTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(height: 15),
            Image.network(imageUrl),
            const SizedBox(height: 15),
            Text(
              title,
              style: textTheme.titleLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Text(
              content,
              style: textTheme.bodyLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
