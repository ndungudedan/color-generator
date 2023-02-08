
import 'package:color_generator/app.dart';
import 'package:color_generator/enums/color_types.dart';
import 'package:color_generator/screens/index_screen.dart';
import 'package:color_generator/widgets/round_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Index screen is laid out properly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(App());

    // Verify that text is displayed.
    expect(find.text('Hey There'), findsOneWidget);

    // Verify ColorTypes containers are rendered
    for (final element in ColorTypes.values) {
      expect(
        find.widgetWithText(RoundContainer, element.name.toUpperCase()),
        findsOneWidget,
      );
    }

    // Verify Brightness SLider is rendered
    expect(find.byType(Slider), findsOneWidget);
  });

  testWidgets('Verify background color changes on tapping screen',
      (tester) async {
    await tester.pumpWidget(App());
    final previousColor =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();
    final newColor =
        tester.widget<Scaffold>(find.byType(Scaffold)).backgroundColor;
    expect(previousColor, isNot(newColor));
  });

  testWidgets('Verify ColorType changes on selection', (tester) async {
    await tester.pumpWidget(App());
    for (final element in ColorTypes.values) {
      await tester.tap(
        find.widgetWithText(
          RoundContainer,
          element.name.toUpperCase(),
        ),
      );
      await tester.pump();
      final ColorTypes selectedColorType = tester
          .state<IndexScreenState>(find.byType(IndexScreen))
          .selectedColorType;
      expect(selectedColorType, element);
    }
  });

}
