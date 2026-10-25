import 'package:flutter/material.dart';
import 'cronograma_screen.dart';
import 'solicitacao_screen.dart';
import '../services/notificacao_service.dart';

class HomeScreen extends StatefulWidget {
  final String nomeUsuario;
  final String bairro;
  final VoidCallback onLogout;

  const HomeScreen({
    super.key, 
    required this.nomeUsuario, 
    required this.bairro, 
    required this.onLogout
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NotificacaoService _notificacaoService = NotificacaoService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coleta Seletiva'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair / Trocar usuário',
            onPressed: widget.onLogout,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Olá, ${widget.nomeUsuario}!',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Seu bairro: ${widget.bairro}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 32),
            
            ElevatedButton.icon(
              icon: const Icon(Icons.calendar_today),
              label: const Text('Ver Cronograma de Coleta'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CronogramaScreen(bairro: widget.bairro)),
                );
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton.icon(
              icon: const Icon(Icons.report_problem),
              label: const Text('Solicitar Coleta Extra'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SolicitacaoScreen()),
                );
              },
            ),
            const SizedBox(height: 32),

            Card(
              child: SwitchListTile(
                title: const Text('Lembretes de Coleta'),
                subtitle: Text(_notificacaoService.mensagem),
                value: _notificacaoService.ativo,
                onChanged: (bool value) {
                  setState(() {
                    _notificacaoService.toggle();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_notificacaoService.mensagem)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}