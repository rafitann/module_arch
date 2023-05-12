import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import 'overlay_service.dart';

class AsukaOverlayService implements OverlayService {
  AsukaOverlayService();

  OverlayEntry? _entry;

  @override
  Future<void> hide() async {
    if (_entry != null) {
      _entry?.remove();
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  @override
  void show({Widget? child}) {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(0.3),
          alignment: Alignment.center,
          child: child ?? const CircularProgressIndicator(),
        );
      },
    );

    Asuka.addOverlay(_entry!);
  }

  @override
  void dispose() {
    hide();
  }
}
