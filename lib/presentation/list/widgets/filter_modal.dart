import 'package:flutter/material.dart';

import 'package:comento_task/application/const/variables.dart';
import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/presentation/widgets/j_button.dart';
import 'package:comento_task/presentation/widgets/j_checkbox.dart';
import 'package:comento_task/presentation/widgets/j_modal.dart';

class FilterModal extends StatelessWidget {
  final Function onClose;
  final Function onSave;

  const FilterModal({
    Key? key,
    required this.onClose,
    required this.onSave,
  }) : super(key: key);

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
                  onTap: () => onClose(),
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
            child: JCheckbox(items: [], onTap: (value) {}),
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
              onTap: () => onSave(),
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
