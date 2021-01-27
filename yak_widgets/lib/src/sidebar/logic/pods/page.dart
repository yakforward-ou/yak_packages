import 'package:flutter/cupertino.dart';
import 'package:riverpod/all.dart';
import '../../../all.dart';
import '../all.dart';

final sidebarPageControllerPod = Provider.autoDispose<PageController>((ref) {
  final controller = PageController();
  final duration = ref.watch(animationDurationPod).state;

  ref.onDispose(controller?.dispose);
  ref.watch(sidebarScrollPod)
    ..addListener((state) {
      if (state != SidebarScroll.idle) {
        if (state != SidebarScroll.up) {
          controller.nextPage(
            duration: duration,
            curve: Curves.easeOut,
          );
        }
        if (state != SidebarScroll.down) {
          controller.previousPage(
            duration: duration,
            curve: Curves.easeOut,
          );
        }
      }
    });
  return controller;
});
