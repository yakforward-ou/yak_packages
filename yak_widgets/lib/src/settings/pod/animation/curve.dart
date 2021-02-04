import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

/// `StateProvider` for `Curve`

const _easeOut = Curves.easeOut;

final animationCurvePod = StateProvider<Curve>((ref) => _easeOut);
