import 'dart:async';
import 'package:flutter/material.dart';
import '../models/usuario.dart';

class CadastroScreen extends StatefulWidget {
  final List<String> bairros;
  final FutureOr<void> Function(Usuario usuario) onCadastrar;
  final Usuario? usuarioInicial;

  const CadastroScreen({
    super.key,
    required this.bairros,
    required this.onCadastrar,
    this.usuarioInicial,
  });

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  late final TextEditingController _nomeController;
  late final TextEditingController _emailController;
  late String _bairroSelecionado;

  @override
  void initState() {
    super.initState();
    final inicial = widget.usuarioInicial;
    _nomeController = TextEditingController(text: inicial?.nome ?? '');
    _emailController = TextEditingController(text: inicial?.email ?? '');
    _bairroSelecionado = (inicial != null && widget.bairros.contains(inicial.bairro))
        ? inicial.bairro
        : widget.bairros.first;
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  bool get _formularioValido =>
      Usuario.nomeValido(_nomeController.text) &&
      Usuario.emailValido(_emailController.text);

  void _cadastrar() {
    final usuario = Usuario(
      nome: _nomeController.text,
      email: _emailController.text,
      bairro: _bairroSelecionado,
    );
    widget.onCadastrar(usuario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: 80, bottom: 40, left: 24, right: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: const Column(
                children: [
                  Icon(Icons.recycling, size: 80, color: Colors.white),
                  SizedBox(height: 16),
                  Text(
                    'Coleta Seletiva',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Sua comunidade mais limpa e organizada.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, -30),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          'Crie sua conta',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 24),
                        TextField(
                          key: const Key('campoNome'),
                          controller: _nomeController,
                          textCapitalization: TextCapitalization.words,
                          decoration: const InputDecoration(
                            labelText: 'Nome completo',
                            prefixIcon: Icon(Icons.person_outline),
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          key: const Key('campoEmail'),
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: 'E-mail',
                            prefixIcon: const Icon(Icons.email_outlined),
                            errorText: _emailController.text.isNotEmpty &&
                                    !Usuario.emailValido(_emailController.text)
                                ? 'E-mail inválido'
                                : null,
                          ),
                          onChanged: (_) => setState(() {}),
                        ),
                        const SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          key: const Key('dropdownBairro'),
                          initialValue: _bairroSelecionado,
                          decoration: const InputDecoration(
                            labelText: 'Selecione seu Bairro',
                            prefixIcon: Icon(Icons.location_on_outlined),
                          ),
                          items: widget.bairros
                              .map((b) => DropdownMenuItem(value: b, child: Text(b)))
                              .toList(),
                          onChanged: (valor) {
                            if (valor != null) setState(() => _bairroSelecionado = valor);
                          },
                        ),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          key: const Key('botaoCadastrar'),
                          onPressed: _formularioValido ? _cadastrar : null,
                          child: const Text('Começar'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}