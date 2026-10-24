import 'package:flutter/material.dart';

class SolicitacaoScreen extends StatefulWidget {
  const SolicitacaoScreen({super.key});

  @override
  State<SolicitacaoScreen> createState() => _SolicitacaoScreenState();
}

class _SolicitacaoScreenState extends State<SolicitacaoScreen> {
  final _motivoController = TextEditingController();
  final _enderecoController = TextEditingController();
  bool _isValido = false;

  @override
  void initState() {
    super.initState();
    _motivoController.addListener(_validar);
    _enderecoController.addListener(_validar);
  }

  void _validar() {
    setState(() {
      _isValido = _motivoController.text.isNotEmpty && _enderecoController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _motivoController.dispose();
    _enderecoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Solicitar Coleta')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _motivoController,
              decoration: const InputDecoration(labelText: 'Motivo (ex: Lixo acumulado)'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(labelText: 'Endereço completo'),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isValido ? () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Solicitação enviada com sucesso!')),
                );
              } : null,
              child: const Text('Enviar Solicitação'),
            ),
          ],
        ),
      ),
    );
  }
}