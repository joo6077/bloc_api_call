import 'package:bloc_api_call/application/const/variables.dart';
import 'package:bloc_api_call/application/enums/order_enum.dart';
import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/application/types/j_option_type.dart';
import 'package:bloc_api_call/presentation/list/bloc/list/list_bloc.dart';
import 'package:bloc_api_call/presentation/list/controllers/modal_controller.dart';
import 'package:bloc_api_call/presentation/widgets/j_button.dart';
import 'package:bloc_api_call/presentation/widgets/j_divider.dart';
import 'package:bloc_api_call/presentation/widgets/j_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListHeader extends StatefulWidget {
  const ListHeader({super.key});

  @override
  State<ListHeader> createState() => _ListHeaderState();
}

class _ListHeaderState extends State<ListHeader> {
  final _modalController = ModalController();

  final List<JOptionType<String>> _orderList = [
    JOptionType(
        name: TEXT_ASCENDING_ORDER,
        isSelected: true,
        value: OrderEnum.asc.value),
    JOptionType(
        name: TEXT_DESCENDING_ORDER,
        isSelected: false,
        value: OrderEnum.desc.value),
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
                  onChange: (orderString) {
                    context
                        .read<ListBloc>()
                        .add(GetListEvent(ord: orderString.value));
                  },
                  items: _orderList,
                ),
                JButton(
                  fontSize: 13,
                  fontColor: customColors.font4,
                  borderColor: customColors.font3,
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
