import 'package:flutter/material.dart';

import 'data/bairros.dart';
import 'models/usuario.dart';
import 'screens/cadastro_screen.dart';
import 'services/usuario_repository.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ColetaSeletivaApp(usuarioRepository: UsuarioRepository()));
}

/// Widget raiz do aplicativo Coleta Seletiva Comunitária.
class ColetaSeletivaApp extends StatefulWidget {
  final UsuarioRepository usuarioRepository;

  const ColetaSeletivaApp({super.key, required this.usuarioRepository});

  @override
  State<ColetaSeletivaApp> createState() => _ColetaSeletivaAppState();
}

class _ColetaSeletivaAppState extends State<ColetaSeletivaApp> {
  Usuario? _usuario;
  bool _carregando = true;

  @override
  void initState() {
    super.initState();
    widget.usuarioRepository.carregar().then((u) {
      if (mounted) setState(() {
        _usuario = u;
        _carregando = false;
      });
    });
  }

  Future<void> _aoCadastrar(Usuario usuario) async {
    await widget.usuarioRepository.salvar(usuario);
    setState(() => _usuario = usuario);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coleta Seletiva Comunitária',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.claro,
      home: _carregando
          ? const Scaffold(body: Center(child: CircularProgressIndicator()))
          : _usuario == null
              ? CadastroScreen(bairros: bairrosAtendidos, onCadastrar: _aoCadastrar)
              : Scaffold(
                  appBar: AppBar(title: const Text('Coleta Seletiva')),
                  body: Center(
                    child: Text('Olá, ${_usuario!.nome}! Bairro: ${_usuario!.bairro}'),
                  ),
                ),
    );
  }
}
