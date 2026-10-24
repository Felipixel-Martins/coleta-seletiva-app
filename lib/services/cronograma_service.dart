import '../models/cronograma.dart';

class CronogramaService {
  List<Cronograma> obterCronogramaPorBairro(String bairro) {
    final todosCronogramas = [
      Cronograma(bairro: 'Centro', diaSemana: 'Segunda-feira', horario: '08:00'),
      Cronograma(bairro: 'Centro', diaSemana: 'Quinta-feira', horario: '08:00'),
      Cronograma(bairro: 'Fazenda', diaSemana: 'Terça-feira', horario: '14:00'),
      Cronograma(bairro: 'Cordeiros', diaSemana: 'Quarta-feira', horario: '10:00'),
    ];

    return todosCronogramas
        .where((c) => c.bairro.toLowerCase() == bairro.toLowerCase())
        .toList();
  }
}