import 'package:flutter/material.dart';

abstract class OverlayService {
  Future<void> hide();
  void show({Widget? child});
  void dispose();
}
