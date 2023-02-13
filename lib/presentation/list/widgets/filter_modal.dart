import 'dart:developer';

import 'package:comento_task/application/enums/order_enum.dart';
import 'package:comento_task/domain/models/category_item_model.dart';
import 'package:comento_task/presentation/list/bloc/list/list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_option_type.dart';
import 'package:comento_task/presentation/list/bloc/category/category_bloc.dart';
import 'package:comento_task/presentation/widgets/j_button.dart';
import 'package:comento_task/presentation/widgets/j_checkbox.dart';
import 'package:comento_task/presentation/widgets/j_modal.dart';

class FilterModal extends StatefulWidget {
  final Function onClose;
  final Function onSave;
  final BuildContext rootContext;

  const FilterModal({
    Key? key,
    required this.onClose,
    required this.onSave,
    required this.rootContext,
  }) : super(key: key);

  @override
  State<FilterModal> createState() => _FilterModalState();
}

class _FilterModalState extends State<FilterModal> {
  List<int> categoryIds = [];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;
    final categoryState = widget.rootContext.watch<CategoryBloc>().state;

    return JModal(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 8.0),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => widget.onClose(),
                  child: Icon(Icons.clear, color: customColors.font4),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              TEXT_FILTER,
              style: textTheme.titleLarge,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Builder(
              builder: (_) {
                if (categoryState is LoadedCategoryState) {
                  final List<JOptionType<CategoryModel>> filters = [];
                  for (var element in categoryState.categories) {
                    filters.add(JOptionType<CategoryModel>(
                        name: element.name.toString(),
                        isSelected: false,
                        value: element));
                  }
                  return JCheckbox<CategoryModel>(
                    items: filters,
                    onTap: (selectedCategoriesValue) {
                      final selectedCategoryIds = <int>[];
                      for (var element in selectedCategoriesValue) {
                        selectedCategoryIds.add(element.value.id);
                      }
                      categoryIds = selectedCategoryIds;
                    },
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: JButton(
              fontSize: 16,
              fontColor: customColors.surface,
              borderColor: Colors.transparent,
              backgroundColor: customColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 8),
              label: TEXT_SAVE,
              onTap: () {
                widget.rootContext
                    .read<ListBloc>()
                    .add(GetListEvent(categoryIds: categoryIds));
                widget.onSave();
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
