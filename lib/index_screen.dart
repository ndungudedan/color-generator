import 'dart:math';

import 'package:color_generator/widgets/round_container.dart';
import 'package:flutter/material.dart';

class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  Color _backgroundColor = Colors.white;
  Color? _rgbColor;
  ColorTypes _selectedColorType = ColorTypes.rgbo;
  double _opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backgroundColor =
              randomColor(opacity: _opacity, colorType: _selectedColorType);
        });
      },
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ColorTypes.values
                    .map(
                      (colorType) => RoundContainer(
                        title: colorType.name.toUpperCase(),
                        containerColor: _selectedColorType == colorType
                            ? Colors.blue
                            : Colors.white,
                        tapCallback: () {
                          setState(() {
                            _selectedColorType = colorType;

                            _backgroundColor = randomColor(
                                opacity: _opacity,
                                colorType: _selectedColorType,
                                prevRgbColor: _rgbColor);
                            if (colorType == ColorTypes.rgbo) {
                              _rgbColor = _backgroundColor;
                            }
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              AnimatedDefaultTextStyle(
                child: const Text('Hey There'),
                style: TextStyle(fontSize: 30),
                duration: Duration.zero,
              ),
              const Spacer(flex: 2,),
              Row(
                children: [
                  const Icon(
                    Icons.brightness_6,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      value: _opacity,
                      onChanged: (value) {
                        setState(() {
                          _opacity = value;
                          _backgroundColor =
                              _backgroundColor.withOpacity(_opacity);
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color randomColor({
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

enum ColorTypes { rgbo, hsl, hsv }
