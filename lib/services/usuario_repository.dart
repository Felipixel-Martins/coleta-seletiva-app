import 'package:shared_preferences/shared_preferences.dart';
import '../models/usuario.dart';

class UsuarioRepository {
  static const _kNome = 'nome';
  static const _kEmail = 'email';
  static const _kBairro = 'bairro';

  // Métodos originais do seu teste da Sprint 1
  Future<void> salvar(Usuario usuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kNome, usuario.nome);
    await prefs.setString(_kEmail, usuario.email);
    await prefs.setString(_kBairro, usuario.bairro);
  }

  Future<Usuario?> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final nome = prefs.getString(_kNome);
    final email = prefs.getString(_kEmail);
    final bairro = prefs.getString(_kBairro);

    if (nome == null || email == null || bairro == null) return null;
    return Usuario(nome: nome, email: email, bairro: bairro);
  }

  Future<void> limpar() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kNome);
    await prefs.remove(_kEmail);
    await prefs.remove(_kBairro);
  }

  // --- Apelidos para o main.dart novo que fizemos ---
  Future<void> salvarUsuario(Usuario usuario) => salvar(usuario);
  Future<Usuario?> obterUsuario() => carregar();
  Future<void> limparUsuario() => limpar();
}