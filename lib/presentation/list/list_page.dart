import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/enums/order_enum.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/detail/bloc/detail_bloc.dart';
import 'package:comento_task/presentation/detail/detail_page.dart';
import 'package:comento_task/presentation/list/bloc/category/category_bloc.dart';
import 'package:comento_task/presentation/list/bloc/list/list_bloc.dart';
import 'package:comento_task/presentation/list/widgets/list_header.dart';
import 'package:comento_task/presentation/widgets/j_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/advertisement_card.dart';
import 'widgets/category_card.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final scrollController = ScrollController();
  int limit = 5;
  String ord = OrderEnum.asc.value;
  bool isAds = false;
  bool isPost = false;

  late final listBloc = context.read<ListBloc>();
  late final categoryBloc = context.read<CategoryBloc>();

  final List<DropdownMenuItem<int>> dropdownMenuItems = [
    const DropdownMenuItem<int>(value: 5, child: Text('5')),
    const DropdownMenuItem<int>(value: 10, child: Text('10')),
    const DropdownMenuItem<int>(value: 15, child: Text('15'))
  ];

  @override
  void initState() {
    categoryBloc.add(GetCategoryEvent());
    categoryBloc.stream
        .firstWhere((element) => element is LoadedCategoryState)
        .then((state) {
      _getListWithCategory();
    });

    scrollController.addListener(() {
      if (!isPost) {
        if (!(listBloc.state as LoadedListState).hasReachedMax) {
          if (scrollController.position.maxScrollExtent ==
              scrollController.offset) {
            listBloc.add(AddListEvent());
          }
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

  String _categoryIdToName(int id) {
    final categoryState = context.watch<CategoryBloc>().state;
    if (categoryState is LoadedCategoryState) {
      for (var element in categoryState.categories) {
        if (id == element.id) {
          return element.name;
        }
      }
    }
    return id.toString();
  }

  void _getListWithCategory() {
    final categoryState = categoryBloc.state as LoadedCategoryState;
    listBloc.add(GetListEvent(
        categoryIds: categoryState.categoryIdsAll,
        page: 1,
        limit: limit,
        ord: ord));
  }

  void _goToDetail(int id) {
    context.read<DetailBloc>().add(GetDetailEvent(id));
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const DetailPage()));
  }

  @override
  Widget build(BuildContext context) {
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
                SliverAppBar(
                  floating: true,
                  toolbarHeight: 191,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                    color: customColors.surface,
                    child: Column(
                      children: [
                        const ListHeader(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                TEXT_ADS,
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            Switch(
                                value: isAds,
                                onChanged: (value) {
                                  setState(() {
                                    isAds = value;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                TEXT_POST,
                                style: textTheme.bodyLarge,
                              ),
                            ),
                            Switch(
                                value: isPost,
                                onChanged: (value) {
                                  _getListWithCategory();
                                  setState(() {
                                    isPost = value;
                                  });
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 10),
                            DropdownButton<int>(
                                value: limit,
                                items: dropdownMenuItems,
                                onChanged: (value) {
                                  limit = value!;
                                  _getListWithCategory();
                                }),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                TEXT_LIMIT,
                                style: textTheme.bodyLarge,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
                (state is LoadedListState)
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate(
                        childCount: state.numbers.length + 1,
                        (context, index) {
                          if (index < state.numbers.length) {
                            if ((index + 1) % 4 == 0) {
                              if (state.ads.length > state.numbers[index]) {
                                final adsItem = state.ads[state.numbers[index]];
                                return isAds
                                    ? const SizedBox()
                                    : AdvertisementCard(
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
                                name: _categoryIdToName(listsItem.categoryId),
                                id: listsItem.id.toString(),
                                userId: listsItem.userId.toString(),
                                title: listsItem.title.toString(),
                                content: listsItem.contents.toString(),
                                onTap: () => _goToDetail(listsItem.id),
                              );
                            }
                          } else {
                            return isPost
                                ? JPagination(
                                    items: state.links,
                                    onTap: (value) {
                                      listBloc.add(GetListEvent(
                                          page: value, limit: limit));
                                    })
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 32),
                                    child: state.hasReachedMax
                                        ? const SizedBox()
                                        : const Center(
                                            child: CircularProgressIndicator()),
                                  );
                          }
                        },
                      ))
                    : SliverToBoxAdapter(
                        child: Expanded(
                            child: Column(
                          children: List.generate(
                              5, (index) => const CategoryCardShimmer()),
                        )),
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
