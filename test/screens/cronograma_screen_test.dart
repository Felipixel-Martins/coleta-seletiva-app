import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/screens/cronograma_screen.dart';

void main() {
  testWidgets('Tela de Cronograma deve exibir os dias e horários', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: CronogramaScreen(bairro: 'Centro')));

    // Verifica se os dias da semana do Centro aparecem
    expect(find.text('Segunda-feira'), findsOneWidget);
    expect(find.text('Quinta-feira'), findsOneWidget);
    
    // Verifica se o horário está na tela (ajustado para o novo design e novos dados)
    expect(find.textContaining('07:00'), findsOneWidget);
    expect(find.textContaining('19:00'), findsOneWidget);
  });
}