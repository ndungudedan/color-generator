import 'package:color_generator/constants/constants.dart';
import 'package:flutter/material.dart';

/// Renders a round-cornered and clickable container displaying a text.
class RoundContainer extends StatelessWidget {
  /// The containers color which  defaults to white
  final Color containerColor;

  /// The text value
  final String title;

  /// A callback for when the container is tapped
  final GestureTapCallback tapCallback;

  /// Instantiates this class and its fields
  const RoundContainer({
    Key? key,
    required this.title,
    this.containerColor = Colors.white,
    required this.tapCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapCallback,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: containerColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Text(title),
      ),
    );
  }
}
