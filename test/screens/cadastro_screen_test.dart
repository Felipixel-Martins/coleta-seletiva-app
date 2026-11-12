import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/screens/cadastro_screen.dart';
import 'package:coleta_seletiva_app/models/usuario.dart';

void main() {
  final bairros = ['Centro', 'Fazenda'];

  Widget buildTela({Usuario? inicial, FutureOr<void> Function(Usuario)? onCadastrar}) {
    return MaterialApp(
      home: CadastroScreen(
        bairros: bairros,
        usuarioInicial: inicial,
        onCadastrar: onCadastrar ?? (_) {},
      ),
    );
  }

  testWidgets('botão "Começar" fica desabilitado com campos vazios', (tester) async {
    await tester.pumpWidget(buildTela());
    final botao = find.widgetWithText(ElevatedButton, 'Começar');
    expect(botao, findsOneWidget);
    expect(tester.widget<ElevatedButton>(botao).onPressed, isNull);
  });

  testWidgets('botão continua desabilitado com e-mail inválido', (tester) async {
    await tester.pumpWidget(buildTela());
    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe');
    await tester.enterText(find.byKey(const Key('campoEmail')), 'email-invalido');
    await tester.pump();
    
    final botao = find.widgetWithText(ElevatedButton, 'Começar');
    expect(tester.widget<ElevatedButton>(botao).onPressed, isNull);
  });

  testWidgets('botão fica habilitado com nome e e-mail válidos', (tester) async {
    await tester.pumpWidget(buildTela());
    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe Martins');
    await tester.enterText(find.byKey(const Key('campoEmail')), 'felipe@edu.univali.br');
    await tester.pump();
    
    final botao = find.widgetWithText(ElevatedButton, 'Começar');
    expect(tester.widget<ElevatedButton>(botao).onPressed, isNotNull);
  });

  testWidgets('bairro pode ser selecionado no dropdown e é enviado no cadastro', (tester) async {
    Usuario? enviado;
    await tester.pumpWidget(buildTela(onCadastrar: (u) async { enviado = u; }));
    
    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe');
    await tester.enterText(find.byKey(const Key('campoEmail')), 'felipe@teste.com');
    await tester.pump();

    await tester.tap(find.byType(DropdownButtonFormField<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Fazenda').last);
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(ElevatedButton, 'Começar'));
    await tester.pumpAndSettle();

    expect(enviado?.bairro, 'Fazenda');
  });
}