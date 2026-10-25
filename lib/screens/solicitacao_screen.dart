import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void _enviar() async {
    final prefs = await SharedPreferences.getInstance();
    final solicitacoes = prefs.getStringList('solicitacoes') ?? [];
    solicitacoes.add('${_motivoController.text} - ${_enderecoController.text}');
    await prefs.setStringList('solicitacoes', solicitacoes);

    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Solicitação enviada com sucesso!')),
    );
    Navigator.pop(context);
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
      appBar: AppBar(title: const Text('Solicitar Coleta Extra')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _motivoController,
              decoration: const InputDecoration(
                labelText: 'Motivo (ex: Lixo acumulado)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endereço completo',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isValido ? _enviar : null,
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
                child: const Text('Enviar Solicitação'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}