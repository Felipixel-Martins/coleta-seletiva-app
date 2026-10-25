import 'package:flutter/material.dart';
import 'models/usuario.dart';
import 'screens/cadastro_screen.dart';
import 'screens/home_screen.dart';
import 'services/usuario_repository.dart';
import 'app_theme.dart'; // Certifique-se de que este arquivo existe

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final repository = UsuarioRepository();
  final usuarioSalvo = await repository.obterUsuario();
  
  runApp(MyApp(usuarioInicial: usuarioSalvo));
}

class MyApp extends StatefulWidget {
  final Usuario? usuarioInicial;
  const MyApp({super.key, this.usuarioInicial});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Usuario? _usuarioAtual;
  final UsuarioRepository _repository = UsuarioRepository();
  
  // Lista de bairros que o app suporta
  final List<String> _bairros = ['Centro', 'Fazenda', 'Cordeiros'];

  @override
  void initState() {
    super.initState();
    _usuarioAtual = widget.usuarioInicial;
  }

  Future<void> _salvarUsuario(Usuario usuario) async {
    await _repository.salvarUsuario(usuario);
    setState(() {
      _usuarioAtual = usuario;
    });
  }

  void _logout() async {
    await _repository.limparUsuario();
    setState(() {
      _usuarioAtual = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coleta Seletiva',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: _usuarioAtual == null
          ? CadastroScreen(
              bairros: _bairros,
              onCadastrar: _salvarUsuario,
            )
          : HomeScreen(
              nomeUsuario: _usuarioAtual!.nome,
              bairro: _usuarioAtual!.bairro,
              onLogout: _logout,
            ),
    );
  }
}