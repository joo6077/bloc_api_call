import 'package:comento_task/presentation/list/widgets/filter_modal.dart';
import 'package:flutter/widgets.dart';

class ModalController {
  OverlayEntry? _filterOverlayEntry;

  void showModal(BuildContext context) {
    _filterOverlayEntry = OverlayEntry(
      builder: (context) => FilterModal(
        onClose: _hideModal,
        onSave: () {
          _hideModal();
        },
      ),
    );

    Overlay.of(context).insert(_filterOverlayEntry!);
  }

  void _hideModal() {
    _filterOverlayEntry?.remove();
  }
}
