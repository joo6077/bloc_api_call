import 'dart:developer';

import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/list/bloc/list_bloc.dart';
import 'package:comento_task/presentation/list/widgets/advertisement_card.dart';
import 'package:comento_task/presentation/list/widgets/category_card.dart';
import 'package:comento_task/presentation/list/widgets/list_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    context.read<ListBloc>().add(GetListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: customColors.surface,
      body: SafeArea(
        child: Container(
          color: customColors.background,
          child: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
            return state is LoadedListState
                ? ListView.builder(
                    itemCount: state.numbers.length,
                    itemBuilder: (BuildContext context, int index) {
                      if ((index + 1) % 4 == 0) {
                        if (state.ads.length > state.numbers[index]) {
                          final adsItem = state.ads[state.numbers[index]];
                          return AdvertisementCard(
                            title: adsItem.title!,
                            content: adsItem.contents!,
                            imageUrl: IMAGE_PATH + adsItem.img!,
                          );
                        }
                        return const SizedBox();
                      } else {
                        final listsItem = state.lists[state.numbers[index]];
                        return CategoryCard(
                          name: listsItem.categoryId.toString(),
                          id: listsItem.id.toString(),
                          userId: listsItem.userId.toString(),
                          title: listsItem.title.toString(),
                          content: listsItem.contents.toString(),
                        );
                      }
                    },
                  )
                : const SizedBox();
          }),
        ),
      ),
    );
  }
}
