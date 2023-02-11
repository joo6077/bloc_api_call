import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
import 'package:comento_task/presentation/list/controllers/modal_controller.dart';
import 'package:comento_task/presentation/widgets/j_button.dart';
import 'package:comento_task/presentation/widgets/j_divider.dart';
import 'package:comento_task/presentation/widgets/j_radio.dart';
import 'package:flutter/material.dart';

class ListHeader extends StatelessWidget {
  ListHeader({super.key});

  final _modalController = ModalController();

  final List<JRadioType> _orderList = [
    JRadioType(name: TEXT_ASCENDING_ORDER, isSelected: true),
    JRadioType(name: TEXT_DESCENDING_ORDER, isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Container(
      color: customColors.surface,
      child: Column(
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
        ],
      ),
    );
  }
}
