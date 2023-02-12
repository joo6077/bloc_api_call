import 'package:comento_task/application/styles/common.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/detail/bloc/detail_bloc.dart';
import 'package:comento_task/presentation/detail/widgets/detail_answer.dart';
import 'package:comento_task/presentation/detail/widgets/detail_header.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DetailBloc, DetailState>(
          builder: (_, state) {
            if (state is LoadedDetailState) {
              final item = state.detailModel;
              return ListView(
                padding: horizontalPadding,
                children: [
                  DetailHeader(
                    title: item.title.toString(),
                    content: item.contents.toString(),
                    createdAt: item.createdAt.toString(),
                    replyCount: item.reply!.length.toString(),
                  ),
                  ...item.reply!
                      .map((e) => DetailAnswer(
                          replyUserName: e.user!.name.toString(),
                          contents: e.contents.toString(),
                          createdAt: e.createdAt.toString()))
                      .toList(),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
