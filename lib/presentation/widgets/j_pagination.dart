import 'package:bloc_api_call/application/utils/primary_extension.dart';
import 'package:bloc_api_call/domain/models/link_model.dart';
import 'package:flutter/material.dart';

import 'package:bloc_api_call/application/styles/j_theme.dart';

class JPagination extends StatelessWidget {
  final List<LinkModel> items;
  final Function(int) onTap;

  const JPagination({
    Key? key,
    required this.items,
    required this.onTap,
  }) : super(key: key);

  String setLabel(String text) {
    switch (text) {
      case 'Previous':
        return '<';
      case 'Next':
        return '>';
      default:
        return text;
    }
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>()!;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: items
            .mapIndexed((e, i) => Container(
                  decoration: BoxDecoration(
                      color: e.active
                          ? customColors.primary
                          : customColors.surface,
                      border: Border(
                          top: BorderSide(color: customColors.disable!),
                          bottom: BorderSide(color: customColors.disable!),
                          left: BorderSide(color: customColors.disable!),
                          right: i == items.length - 1
                              ? BorderSide(color: customColors.disable!)
                              : BorderSide.none)),
                  width: 30,
                  height: 30,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        if (e.url == null) return;
                        onTap(int.parse(e.url!.split('=').last));
                      },
                      child: Center(
                          child: Text(
                        setLabel(e.label.toString()),
                        style: TextStyle(
                            color: e.active
                                ? customColors.surface
                                : customColors.font1),
                      )),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
