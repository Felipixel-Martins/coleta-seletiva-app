import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/screens/cronograma_screen.dart';

void main() {
  testWidgets('Tela de Cronograma deve exibir os dias e horários', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CronogramaScreen(bairro: 'Centro')));

    expect(find.text('Segunda-feira'), findsOneWidget);
    expect(find.text('Quinta-feira'), findsOneWidget);
expect(find.text('Horário: 08:00'), findsNWidgets(2));  });
}