import 'package:coleta_seletiva_app/models/usuario.dart';
import 'package:coleta_seletiva_app/services/usuario_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('retorna null quando não há usuário salvo', () async {
    final repo = UsuarioRepository();

    expect(await repo.carregar(), isNull);
  });

  test('salva e recupera o usuário cadastrado', () async {
    final repo = UsuarioRepository();
    final usuario =
        Usuario(nome: 'Felipe', email: 'felipe@email.com', bairro: 'Centro');

    await repo.salvar(usuario);

    // Nova instância simula reabrir o app.
    final recuperado = await UsuarioRepository().carregar();
    expect(recuperado, usuario);
  });
}
