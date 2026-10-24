import 'dart:async';

import 'package:flutter/material.dart';

import '../models/usuario.dart';

/// Tela de cadastro simplificado: nome, e-mail e bairro.
///
/// O botão "Cadastrar" só é habilitado quando nome e e-mail são válidos.
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
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Icon(Icons.recycling, size: 72, color: tema.colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              'Coleta Seletiva Comunitária',
              textAlign: TextAlign.center,
              style: tema.textTheme.headlineSmall,
            ),
            const SizedBox(height: 4),
            Text(
              'Informe seus dados para ver a coleta do seu bairro.',
              textAlign: TextAlign.center,
              style: tema.textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            TextField(
              key: const Key('campoNome'),
              controller: _nomeController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Nome',
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
                    ? 'Informe um e-mail válido'
                    : null,
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              key: const Key('dropdownBairro'),
              initialValue: _bairroSelecionado,
              decoration: const InputDecoration(
                labelText: 'Bairro',
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
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
