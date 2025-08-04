import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glossy_morphism/widgets/glass_container.dart';

void main() {
  testWidgets('GlassContainer renders with child text', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: GlassContainer(
            child: Text('Test Text'),
          ),
        ),
      ),
    );

    // Check if Text widget is rendered
    expect(find.text('Test Text'), findsOneWidget);

    // Check if GlassContainer is rendered
    expect(find.byType(GlassContainer), findsOneWidget);
  });
}
