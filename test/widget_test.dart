// Basic smoke test for the portfolio app.

import 'package:flutter_test/flutter_test.dart';

import 'package:port/main.dart';

void main() {
  testWidgets('Portfolio renders smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Building software\nthat actually.'), findsOneWidget);
    expect(find.textContaining('Aayam'), findsWidgets);
  });
}