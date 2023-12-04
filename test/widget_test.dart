import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lista_de_tarefas/main.dart';

void main() {
  testWidgets('TasksPage smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: TasksPage(),
    ));

    // Verify that your widgets are rendered as expected.
    expect(find.text('Comprar pão'), findsOneWidget);
    expect(find.text('Lavar a louça'), findsOneWidget);
    expect(find.text('Ir ao banco'), findsOneWidget);
    expect(find.text('Fazer exercícios'), findsOneWidget);
    expect(find.text('Ler um livro'), findsOneWidget);

    // You can add more test scenarios based on your app's functionality.
  });
}
