import 'package:color_generator/business_logic/random_color.dart';
import 'package:color_generator/constants/constants.dart';
import 'package:color_generator/enums/color_types.dart';
import 'package:color_generator/widgets/round_container.dart';
import 'package:flutter/material.dart';

/// Renders the apps only screen UI
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
          _backgroundColor = RandomColor.randomColor(
              opacity: _opacity, colorType: _selectedColorType,);
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
                        containerColor: _selectedColorType == colorType
                            ? Colors.blue
                            : Colors.white,
                        tapCallback: () {
                          setState(() {
                            _selectedColorType = colorType;

                            _backgroundColor = RandomColor.randomColor(
                                opacity: _opacity,
                                colorType: _selectedColorType,
                                prevRgbColor: _rgbColor,);
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
                style: TextStyle(fontSize: bigTextFontSize),
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
}
