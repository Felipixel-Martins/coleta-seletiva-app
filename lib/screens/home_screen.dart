import 'package:flutter/material.dart';
import 'cronograma_screen.dart';
import 'solicitacao_screen.dart';
import 'historico_screen.dart'; // Importação adicionada
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
        title: const Text('Início'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Sair',
            onPressed: widget.onLogout,
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabeçalho de Boas-vindas
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: const Color(0xFF2E7D32).withOpacity(0.3), blurRadius: 10, offset: const Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Olá, ${widget.nomeUsuario} 👋',
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.white70, size: 16),
                      const SizedBox(width: 4),
                      Text('Bairro: ${widget.bairro}', style: const TextStyle(fontSize: 16, color: Colors.white70)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            const Text('O que você precisa?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Botão Cronograma
            _AcaoCard(
              icone: Icons.calendar_month,
              corIcone: Colors.blue,
              titulo: 'Ver Cronograma',
              subtitulo: 'Confira os dias e horários da coleta',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => CronogramaScreen(bairro: widget.bairro)));
              },
            ),
            const SizedBox(height: 16),

            // Botão Solicitação
            _AcaoCard(
              icone: Icons.campaign,
              corIcone: Colors.orange,
              titulo: 'Solicitar Coleta Extra',
              subtitulo: 'Informe acúmulo irregular de lixo',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const SolicitacaoScreen()));
              },
            ),
            const SizedBox(height: 16),

            // NOVO Botão Histórico
            _AcaoCard(
              icone: Icons.history,
              corIcone: Colors.purple,
              titulo: 'Minhas Solicitações',
              subtitulo: 'Veja o histórico de pedidos enviados',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const HistoricoScreen()));
              },
            ),
            
            const SizedBox(height: 32),

            const Text('Configurações', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Card de Notificação
            Card(
              child: SwitchListTile(
                secondary: const Icon(Icons.notifications_active, color: Color(0xFF2E7D32)),
                title: const Text('Lembretes de Coleta', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(_notificacaoService.mensagem),
                value: _notificacaoService.ativo,
                activeColor: const Color(0xFF2E7D32),
                onChanged: (bool value) {
                  setState(() {
                    _notificacaoService.toggle();
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(_notificacaoService.mensagem), behavior: SnackBarBehavior.floating),
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

// Widget auxiliar para os botões da Home
class _AcaoCard extends StatelessWidget {
  final IconData icone;
  final Color corIcone;
  final String titulo;
  final String subtitulo;
  final VoidCallback onTap;

  const _AcaoCard({required this.icone, required this.corIcone, required this.titulo, required this.subtitulo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: corIcone.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icone, color: corIcone, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(subtitulo, style: TextStyle(fontSize: 14, color: Colors.grey.shade600)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}