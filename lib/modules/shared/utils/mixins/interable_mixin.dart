import 'package:flutter/material.dart';

import '../../presentation/atomic/atoms/page_visibility_atom.dart';
import '../../presentation/atomic/atoms/transform_effect_atom.dart';

extension IterableExtension on Iterable<Widget> {
  List<TransformEffectAtom> transformEffectChildren({
    required PageVisibility pageVisibility,
    double translationFactor = 300.0,
  }) {
    return map((widget) {
      return TransformEffectAtom(
        pageVisibility: pageVisibility,
        translationFactor: translationFactor,
        child: widget,
      );
    }).toList();
  }
}
