import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
import 'package:comento_task/presentation/list/controllers/modal_controller.dart';
import 'package:comento_task/presentation/list/widgets/advertisement_card.dart';
import 'package:comento_task/presentation/list/widgets/category_card.dart';
import 'package:comento_task/presentation/list/widgets/filter_modal.dart';
import 'package:comento_task/presentation/widgets/j_button.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:comento_task/presentation/widgets/j_radio.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final _modalController = ModalController();

  final List<JRadioType> _orderList = [
    JRadioType(name: TEXT_ASCENDING_ORDER, isSelected: true),
    JRadioType(name: TEXT_DESCENDING_ORDER, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Scaffold(
      body: ListView(
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
                  onTap: () => _modalController.showModal(context),
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
          const SizedBox(
            height: 10,
          ),
          const AdvertisementCard(
            name: 'name',
            title: 'title',
            content: 'content',
            // imageUrl: '',
            imageUrl: 'https://cdn.comento.kr/assignment/test2.jpg',
          ),
        ],
      ),
    );
  }
}
