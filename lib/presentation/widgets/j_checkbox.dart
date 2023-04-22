import 'package:bloc_api_call/application/styles/j_theme.dart';
import 'package:bloc_api_call/application/types/j_option_type.dart';
import 'package:bloc_api_call/application/utils/primary_extension.dart';
import 'package:flutter/material.dart';

class JCheckbox<T> extends StatefulWidget {
  final List<JOptionType<T>> items;
  final Function(List<JOptionType<T>>) onTap;

  const JCheckbox({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  @override
  State<JCheckbox> createState() => _JCheckboxState<T>();
}

class _JCheckboxState<T> extends State<JCheckbox<T>> {
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
    final textTheme = Theme.of(context).textTheme;
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Column(
      children: widget.items
          .mapIndexed(
            (item, index) => Padding(
              padding: EdgeInsets.only(
                  bottom: index != widget.items.length - 1 ? 10 : 0),
              child: Material(
                color: Colors.transparent,
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
                              Border.all(color: customColors.font3!, width: 1),
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
                      Text(
                        item.name,
                        style: textTheme.titleMedium!
                            .copyWith(color: customColors.font1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
