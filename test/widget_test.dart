import 'package:flutter_test/flutter_test.dart';
import 'package:campus_connect/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusConnectApp());
    expect(find.text('CampusConnect'), findsOneWidget);
  });
}
