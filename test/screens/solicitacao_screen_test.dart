import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/screens/solicitacao_screen.dart';

void main() {
  testWidgets('Botão de enviar deve estar desabilitado se o motivo estiver vazio', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SolicitacaoScreen()));

    final botao = find.byType(ElevatedButton);
    expect(tester.widget<ElevatedButton>(botao).onPressed, isNull);
  });
}