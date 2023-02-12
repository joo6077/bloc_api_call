import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/enums/order_enum.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/detail/bloc/detail_bloc.dart';
import 'package:comento_task/presentation/detail/detail_page.dart';
import 'package:comento_task/presentation/list/bloc/list/list_bloc.dart';
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
  final scrollController = ScrollController();
  int limit = 10;
  String ord = OrderEnum.asc.value;

  @override
  void initState() {
    final listBloc = context.read<ListBloc>();
    listBloc.add(GetListEvent(
        categoryIds: const [1, 2, 3], page: 1, limit: limit, ord: ord));

    scrollController.addListener(() {
      if (!(listBloc.state as LoadedListState).hasReachedMax) {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          listBloc.add(AddListEvent());
        }
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      backgroundColor: customColors.surface,
      body: SafeArea(
        child: BlocBuilder<ListBloc, ListState>(builder: (_, state) {
          return Container(
            color: customColors.background,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverAppBar(
                  floating: true,
                  toolbarHeight: 41,
                  flexibleSpace: FlexibleSpaceBar(background: ListHeader()),
                ),
                SliverList(
                  delegate: state is LoadedListState
                      ? SliverChildBuilderDelegate(
                          childCount: state.numbers.length + 1,
                          (context, index) {
                            if (index < state.numbers.length) {
                              if ((index + 1) % 4 == 0) {
                                if (state.ads.length > state.numbers[index]) {
                                  final adsItem =
                                      state.ads[state.numbers[index]];
                                  return AdvertisementCard(
                                    title: adsItem.title,
                                    content: adsItem.contents,
                                    imageUrl: IMAGE_PATH + adsItem.img,
                                  );
                                }
                                return const SizedBox();
                              } else {
                                final listsItem =
                                    state.lists[state.numbers[index]];
                                return CategoryCard(
                                  name: listsItem.categoryId.toString(),
                                  id: listsItem.id.toString(),
                                  userId: listsItem.userId.toString(),
                                  title: listsItem.title.toString(),
                                  content: listsItem.contents.toString(),
                                  onTap: () {
                                    context
                                        .read<DetailBloc>()
                                        .add(GetDetailEvent(listsItem.id));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                const DetailPage()));
                                  },
                                );
                              }
                            } else {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 32),
                                child: state.hasReachedMax
                                    ? const Text('end')
                                    : const Center(
                                        child: CircularProgressIndicator()),
                              );
                            }
                          },
                        )
                      : SliverChildListDelegate([]),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
