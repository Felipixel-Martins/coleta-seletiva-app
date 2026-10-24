import 'package:flutter/material.dart';
import '../models/cronograma.dart';
import '../services/cronograma_service.dart';

class CronogramaScreen extends StatefulWidget {
  final String bairro;
  const CronogramaScreen({super.key, required this.bairro});

  @override
  State<CronogramaScreen> createState() => _CronogramaScreenState();
}

class _CronogramaScreenState extends State<CronogramaScreen> {
  final CronogramaService _service = CronogramaService();
  late List<Cronograma> _cronogramas;

  @override
  void initState() {
    super.initState();
    _cronogramas = _service.obterCronogramaPorBairro(widget.bairro);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Coleta - ${widget.bairro}')),
      body: _cronogramas.isEmpty
          ? const Center(child: Text('Nenhum cronograma encontrado.'))
          : ListView.builder(
              itemCount: _cronogramas.length,
              itemBuilder: (context, index) {
                final c = _cronogramas[index];
                return ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: Text(c.diaSemana),
                  subtitle: Text('Horário: ${c.horario}'),
                );
              },
            ),
    );
  }
}