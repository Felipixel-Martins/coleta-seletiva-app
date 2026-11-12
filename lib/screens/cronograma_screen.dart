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
      appBar: AppBar(title: Text('Agenda: ${widget.bairro}')),
      body: _cronogramas.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey.shade400),
                  const SizedBox(height: 16),
                  Text('Nenhum cronograma para este bairro.', style: TextStyle(color: Colors.grey.shade600)),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cronogramas.length,
              itemBuilder: (context, index) {
                final c = _cronogramas[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.green.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
                          child: const Icon(Icons.local_shipping, color: Colors.green, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(c.diaSemana, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                                  const SizedBox(width: 4),
                                  Text('A partir das ${c.horario}', style: TextStyle(fontSize: 14, color: Colors.grey.shade700)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}