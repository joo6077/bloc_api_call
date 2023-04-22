import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/presentation/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerWidget.rectangular({
    super.key,
    this.width = double.infinity,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    return ShimmerLoading(
      isLoading: true,
      child: Container(
        width: width,
        height: height,
        color: customColors.font3,
      ),
    );
  }
}
