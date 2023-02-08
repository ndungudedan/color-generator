import 'dart:math';

import 'package:color_generator/business_logic/random_color.dart';
import 'package:color_generator/enums/color_types.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RandomColor Class Tests:', () {
    const ColorTypes colorType = ColorTypes.rgbo;
    test('Test [randomColor] Function returns a random color', () {
      final Color randomColor = RandomColor.randomColor(colorType: colorType);
      final Color anotherColor = RandomColor.randomColor(colorType: colorType);
      expect(randomColor.value, isNot(anotherColor.value));
    });

  });
}
