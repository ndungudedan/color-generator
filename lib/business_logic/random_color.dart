import 'dart:math';

import 'package:color_generator/enums/color_types.dart';
import 'package:flutter/material.dart';

/// Contains random color generation logic.
class RandomColor{

    /// Generates and returns a random color.
    /// 
    /// Depending on the color type which is represented by [ColorTypes], 
    /// a color is generated and returned where RGBO is the default color 
    /// and the other types derived from it.
    /// 
    /// [prevRgbColor] represents an RGBO color previously generated that a user
    ///  would like to view it`s different HSL and HSV variants.
    /// 
    static Color randomColor({
    double opacity = 1.0,
    required ColorTypes colorType,
    Color? prevRgbColor,
  }) {
    final Random random = Random();

    final int redVal = random.nextInt(255);
    final int greenVal = random.nextInt(255);
    final int blueVal = random.nextInt(255);

    final double saturationLevel = random.nextDouble();
    final double hueLevel = random.nextDouble() * 360;
    
    Color randomColor = Color.fromRGBO(redVal, greenVal, blueVal, opacity);
    if (prevRgbColor != null) {
      randomColor = prevRgbColor.withOpacity(opacity);
    }

    switch (colorType) {
      case ColorTypes.rgbo:
        return randomColor;

      case ColorTypes.hsl:
        final double lightnessLevel = random.nextDouble();
        return HSLColor.fromColor(randomColor)
            .withSaturation(saturationLevel)
            .withLightness(lightnessLevel)
            .withHue(hueLevel)
            .toColor();

      case ColorTypes.hsv:
        return HSVColor.fromColor(randomColor)
            .withSaturation(saturationLevel)
            .withValue(opacity)
            .withHue(hueLevel)
            .toColor();

      default:
        return randomColor;
    }
  }

}
