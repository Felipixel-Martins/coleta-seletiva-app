import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/usuario.dart';

/// Persiste o usuário cadastrado localmente via shared_preferences.
class UsuarioRepository {
  static const _chave = 'usuario_cadastrado';

  Future<void> salvar(Usuario usuario) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_chave, jsonEncode(usuario.toMap()));
  }

  Future<Usuario?> carregar() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString(_chave);
    if (json == null) return null;
    return Usuario.fromMap(jsonDecode(json) as Map<String, dynamic>);
  }
}
