import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
import 'package:comento_task/presentation/list/widgets/advertisement_card.dart';
import 'package:comento_task/presentation/list/widgets/category_card.dart';
import 'package:comento_task/presentation/widgets/j_button.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:comento_task/presentation/widgets/j_radio.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  ListPage({super.key});

  final List<JRadioType> _orderList = [
    JRadioType(name: TEXT_ASCENDING_ORDER, isSelected: true),
    JRadioType(name: TEXT_DESCENDING_ORDER, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JRadio(
                onChange: (value) {},
                items: _orderList,
              ),
              JButton(
                label: TEXT_FILTER,
                onTap: () {},
              ),
            ],
          ),
        ),
        const JDivider(),
        const CategoryCard(
          name: 'name',
          id: 'id',
          userId: 'userId',
          title: 'Title',
          content: 'content',
        ),
        SizedBox(
          height: 10,
        ),
        AdvertisementCard(
          name: 'name',
          title: 'title',
          content: 'content',
          imageUrl: 'https://cdn.comento.kr/assignment/test2.jpg',
        ),
      ],
    );
  }
}
