import 'package:coleta_seletiva_app/models/usuario.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Usuario', () {
    test('lança erro quando o e-mail é inválido', () {
      expect(
        () => Usuario(nome: 'Felipe', email: 'email-invalido', bairro: 'Centro'),
        throwsArgumentError,
      );
    });

    test('lança erro quando o nome está vazio', () {
      expect(
        () => Usuario(nome: '   ', email: 'felipe@email.com', bairro: 'Centro'),
        throwsArgumentError,
      );
    });

    test('cria um usuário válido com sucesso', () {
      final usuario =
          Usuario(nome: 'Felipe', email: 'felipe@email.com', bairro: 'Centro');

      expect(usuario.nome, 'Felipe');
      expect(usuario.email, 'felipe@email.com');
      expect(usuario.bairro, 'Centro');
    });

    test('converte para Map e reconstrói a partir do Map', () {
      final original =
          Usuario(nome: 'Felipe', email: 'felipe@email.com', bairro: 'Centro');

      final copia = Usuario.fromMap(original.toMap());

      expect(copia, original);
    });
  });
}
