import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// `StateProvider` for `Curve`
final animationCurvePod = StateProvider<Curve>((ref) => Curves.easeOut);
