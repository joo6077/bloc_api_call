import 'package:comento_task/application/styles/j_theme.dart';
import 'package:comento_task/application/types/j_radio_type.dart';
import 'package:comento_task/application/utils/primary_extension.dart';
import 'package:flutter/material.dart';

class JRadio extends StatefulWidget {
  final List<JRadioType> items;
  final JRadioOnChange onChange;

  const JRadio({
    Key? key,
    required this.items,
    required this.onChange,
  }) : super(key: key);

  @override
  State<JRadio> createState() => _JRadioState();
}

class _JRadioState extends State<JRadio> {
  void _changeItem(int selectedIndex, JRadioType item) {
    for (var i = 0; i < widget.items.length; i++) {
      setState(() {
        if (i == selectedIndex) {
          widget.items[i] = widget.items[i].copyWith(isSelected: true);
        } else {
          widget.items[i] = widget.items[i].copyWith(isSelected: false);
        }
      });
    }

    widget.onChange(item);
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Row(
      children: widget.items
          .mapIndexed(
            (item, index) => Padding(
              padding: EdgeInsets.only(
                  right: index != widget.items.length - 1 ? 10 : 0),
              child: InkWell(
                onTap: () => _changeItem(index, item),
                child: Row(
                  children: [
                    Container(
                      width: 7.5,
                      height: 7.5,
                      decoration: BoxDecoration(
                        color: item.isSelected
                            ? customColors.primary
                            : customColors.disable,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      item.name,
                      style: TextStyle(
                        color: item.isSelected
                            ? Colors.black
                            : customColors.disable,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}