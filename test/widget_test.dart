import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:catty/main.dart';
import 'package:catty/providers/quiz_provider.dart';

void main() {
  testWidgets('Catty app starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => QuizProvider(),
        child: const CattyApp(),
      ),
    );

    expect(find.byType(CattyApp), findsOneWidget);
  });
}
