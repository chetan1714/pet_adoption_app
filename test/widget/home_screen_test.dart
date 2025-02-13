import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:pet_adoption_app/providers/pet_provider.dart';
import 'package:pet_adoption_app/providers/theme_provider.dart';
import 'package:pet_adoption_app/screens/home_screen.dart';

void main() {
  testWidgets('HomeScreen displays list of pets', (WidgetTester tester) async {
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()), // ✅ Ensure ThemeProvider
          ChangeNotifierProvider(create: (_) => PetProvider()),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle(); // ✅ Wait for widgets to finish rendering

    expect(find.text("Pet Adoption App"), findsOneWidget); // ✅ Ensure AppBar text is present
    expect(find.byType(ListView), findsOneWidget);
  });

  testWidgets("Search filters the list", (WidgetTester tester) async {
    final provider = PetProvider();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
          ChangeNotifierProvider.value(value: provider),
        ],
        child: const MaterialApp(home: HomeScreen()),
      ),
    );

    await tester.pumpAndSettle(); // ✅ Wait for UI to render

    await tester.enterText(find.byType(TextField), "Luna");
    await tester.pump();

    expect(find.text("Luna"), findsOneWidget);
  });
}
