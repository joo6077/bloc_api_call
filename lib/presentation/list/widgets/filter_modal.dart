import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
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
  @override
  void initState() {
    context.read<CategoryBloc>().add(GetCategoryEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

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
                child: InkWell(
                  onTap: () => widget.onClose(),
                  child: Icon(Icons.clear, color: customColors.disable),
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
            child: BlocBuilder<CategoryBloc, CategoryState>(
              builder: (_, state) {
                if (state is LoadedCategoryState) {
                  final List<JRadioType> filters = [];
                  for (var element in state.categories) {
                    filters.add(JRadioType(
                        name: element.name.toString(), isSelected: false));
                  }
                  return JCheckbox(items: filters, onTap: (value) {});
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
              fontSize: 20,
              labelColor: customColors.surface,
              borderColor: Colors.transparent,
              backgroundColor: customColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 8),
              label: TEXT_SAVE,
              onTap: () => widget.onSave(),
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
