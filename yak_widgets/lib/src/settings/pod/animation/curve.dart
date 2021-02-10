import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

const _easeOut = Curves.easeOut;

/// `StateProvider` for `Curve`
final animationCurvePod = StateProvider<Curve>((ref) => _easeOut);
