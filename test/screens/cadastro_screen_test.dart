import 'package:coleta_seletiva_app/models/usuario.dart';
import 'package:coleta_seletiva_app/screens/cadastro_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const bairros = ['Centro', 'Fazenda', 'Cordeiros'];

  Future<void> montarTela(
    WidgetTester tester, {
    void Function(Usuario)? onCadastrar,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: CadastroScreen(
          bairros: bairros,
          onCadastrar: onCadastrar ?? (_) {},
        ),
      ),
    );
  }

  ElevatedButton botaoCadastrar(WidgetTester tester) =>
      tester.widget<ElevatedButton>(find.byKey(const Key('botaoCadastrar')));

  testWidgets('botão "Cadastrar" fica desabilitado com campos vazios',
      (tester) async {
    await montarTela(tester);

    expect(find.text('Cadastrar'), findsOneWidget);
    expect(botaoCadastrar(tester).onPressed, isNull);
  });

  testWidgets('botão continua desabilitado com e-mail inválido',
      (tester) async {
    await montarTela(tester);

    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe');
    await tester.enterText(find.byKey(const Key('campoEmail')), 'felipe@');
    await tester.pump();

    expect(botaoCadastrar(tester).onPressed, isNull);
  });

  testWidgets('botão fica habilitado com nome e e-mail válidos',
      (tester) async {
    await montarTela(tester);

    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe');
    await tester.enterText(
        find.byKey(const Key('campoEmail')), 'felipe@email.com');
    await tester.pump();

    expect(botaoCadastrar(tester).onPressed, isNotNull);
  });

  testWidgets('bairro pode ser selecionado no dropdown e é enviado no cadastro',
      (tester) async {
    Usuario? cadastrado;
    await montarTela(tester, onCadastrar: (u) => cadastrado = u);

    await tester.enterText(find.byKey(const Key('campoNome')), 'Felipe');
    await tester.enterText(
        find.byKey(const Key('campoEmail')), 'felipe@email.com');

    await tester.tap(find.byKey(const Key('dropdownBairro')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Fazenda').last);
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('botaoCadastrar')));
    await tester.pump();

    expect(cadastrado, isNotNull);
    expect(cadastrado!.bairro, 'Fazenda');
  });
}
