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
      const SnackBar(content: Text('Solicitação registrada com sucesso!'), backgroundColor: Colors.green),
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
      appBar: AppBar(title: const Text('Nova Solicitação')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.report_problem, size: 64, color: Colors.orange),
            const SizedBox(height: 16),
            const Text(
              'Relatar acúmulo irregular',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Preencha os dados abaixo para solicitar uma coleta extraordinária na sua região.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 32),
            
            TextField(
              controller: _motivoController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Qual o problema?',
                hintText: 'Ex: Lixo acumulado na esquina',
                prefixIcon: Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _enderecoController,
              decoration: const InputDecoration(
                labelText: 'Endereço completo',
                hintText: 'Rua, número, ponto de referência',
                prefixIcon: Icon(Icons.location_on),
              ),
            ),
            const SizedBox(height: 32),
            
            ElevatedButton(
              onPressed: _isValido ? _enviar : null,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text('Enviar Solicitação'),
            ),
          ],
        ),
      ),
    );
  }
}