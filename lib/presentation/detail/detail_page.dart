import 'package:bloc_api_call/application/styles/common.dart';
import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/presentation/detail/bloc/detail_bloc.dart';
import 'package:bloc_api_call/presentation/detail/widgets/detail_answer.dart';
import 'package:bloc_api_call/presentation/detail/widgets/detail_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop(true);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop(true);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: customColors.font1,
            ),
          ),
        ),
        backgroundColor: customColors.surface,
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
                      replyCount: item.reply.length.toString(),
                    ),
                    ...item.reply
                        .map((e) => DetailAnswer(
                            replyUserName: e.user.name.toString(),
                            contents: e.contents.toString(),
                            createdAt: e.createdAt.toString()))
                        .toList(),
                  ],
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      const DetailHeaderShimmer(),
                      ...List.generate(
                          5, (index) => const DetailAnswerShimmer())
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
