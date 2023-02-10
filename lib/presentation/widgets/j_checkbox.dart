import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
import 'package:comento_task/application/utils/primary_extension.dart';
import 'package:flutter/material.dart';

class JCheckbox extends StatefulWidget {
  final List<JRadioType> items;
  final Function(List<JRadioType>) onTap;

  const JCheckbox({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  State<JCheckbox> createState() => _JCheckboxState();
}

class _JCheckboxState extends State<JCheckbox> {
  void _selectItem(int selectedIndex) {
    setState(() {
      widget.items[selectedIndex] = widget.items[selectedIndex]
          .copyWith(isSelected: !widget.items[selectedIndex].isSelected);
    });

    final result = widget.items.where((element) => element.isSelected).toList();

    widget.onTap(result);
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      children: widget.items
          .mapIndexed(
            (item, index) => Padding(
              padding: EdgeInsets.only(
                  bottom: index != widget.items.length - 1 ? 10 : 0),
              child: InkWell(
                onTap: () => _selectItem(index),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: item.isSelected
                            ? customColors.primary
                            : customColors.surface,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(1)),
                        border:
                            Border.all(color: customColors.disable!, width: 1),
                      ),
                      child: item.isSelected
                          ? Icon(
                              Icons.check,
                              size: 15,
                              color: customColors.surface,
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(width: 15),
                    Text(item.name),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
