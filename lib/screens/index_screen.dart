import 'package:color_generator/business_logic/random_color.dart';
import 'package:color_generator/constants/constants.dart';
import 'package:color_generator/enums/color_types.dart';
import 'package:color_generator/widgets/round_container.dart';
import 'package:flutter/material.dart';

/// Renders the apps only screen UI
class IndexScreen extends StatefulWidget {
  @override
  State<IndexScreen> createState() => IndexScreenState();
}

/// Holds the IndexScreen state
class IndexScreenState extends State<IndexScreen> {
  /// Holds the type of color being generated
  ColorTypes selectedColorType = ColorTypes.rgbo;

  /// Holds the opacity value altered by the slider
  double opacity = 1.0;

  Color _backgroundColor = Colors.white;
  Color? _rgbColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _backgroundColor = RandomColor.randomColor(
            opacity: opacity,
            colorType: selectedColorType,
          );
        });
      },
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ColorTypes.values
                    .map(
                      (colorType) => RoundContainer(
                        title: colorType.name.toUpperCase(),
                        containerColor: selectedColorType == colorType
                            ? Colors.blue
                            : Colors.white,
                        tapCallback: () {
                          setState(() {
                            selectedColorType = colorType;

                            _backgroundColor = RandomColor.randomColor(
                              opacity: opacity,
                              colorType: selectedColorType,
                              prevRgbColor: _rgbColor,
                            );
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
              const AnimatedDefaultTextStyle(
                style: TextStyle(
                    fontSize: bigTextFontSize, color: Colors.blueGrey,),
                duration: Duration.zero,
                child: Text('Hey There'),
              ),
              const Spacer(
                flex: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.brightness_6,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Slider.adaptive(
                      value: opacity,
                      onChanged: (value) {
                        setState(() {
                          opacity = value;
                          _backgroundColor =
                              _backgroundColor.withOpacity(opacity);
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
}
