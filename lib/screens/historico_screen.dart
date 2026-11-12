import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HistoricoScreen extends StatefulWidget {
  const HistoricoScreen({super.key});

  @override
  State<HistoricoScreen> createState() => _HistoricoScreenState();
}

class _HistoricoScreenState extends State<HistoricoScreen> {
  List<String> _solicitacoes = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _carregarHistorico();
  }

  Future<void> _carregarHistorico() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _solicitacoes = prefs.getStringList('solicitacoes') ?? [];
      _isLoading = false;
    });
  }

  Future<void> _limparHistorico() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('solicitacoes');
    setState(() => _solicitacoes = []);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Histórico limpo com sucesso!'), backgroundColor: Colors.green),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minhas Solicitações'),
        actions: [
          if (_solicitacoes.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.delete_sweep),
              tooltip: 'Limpar histórico',
              onPressed: _limparHistorico,
            )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _solicitacoes.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.inbox, size: 80, color: Colors.grey.shade400),
                      const SizedBox(height: 16),
                      Text('Nenhuma solicitação registrada.', style: TextStyle(color: Colors.grey.shade600, fontSize: 16)),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _solicitacoes.length,
                  itemBuilder: (context, index) {
                    // A string foi salva como "Motivo - Endereço"
                    final solicitacao = _solicitacoes[index];
                    final partes = solicitacao.split(' - ');
                    final motivo = partes.isNotEmpty ? partes[0] : solicitacao;
                    final endereco = partes.length > 1 ? partes[1] : '';

                    return Card(
                      child: ListTile(
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.report, color: Colors.orange),
                        ),
                        title: Text(motivo, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(endereco),
                        trailing: const Icon(Icons.check_circle, color: Colors.green),
                      ),
                    );
                  },
                ),
    );
  }
}