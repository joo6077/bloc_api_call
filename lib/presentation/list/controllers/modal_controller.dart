import 'package:comento_task/domain/repositories/comento_repository.dart';
import 'package:comento_task/presentation/list/bloc/category/category_bloc.dart';
import 'package:comento_task/presentation/list/widgets/filter_modal.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModalController {
  OverlayEntry? _filterOverlayEntry;

  void showModal(BuildContext context) {
    _filterOverlayEntry = OverlayEntry(
      builder: (_) => BlocProvider(
        create: (__) => CategoryBloc(context.read<ListRepository>()),
        child: FilterModal(
          onClose: _hideModal,
          onSave: () {
            _hideModal();
          },
          rootContext: context,
        ),
      ),
    );

    Overlay.of(context).insert(_filterOverlayEntry!);
  }

  void _hideModal() {
    _filterOverlayEntry?.remove();
  }
}
