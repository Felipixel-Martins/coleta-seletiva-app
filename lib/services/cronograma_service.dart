import '../models/cronograma.dart';

class CronogramaService {
  List<Cronograma> obterCronogramaPorBairro(String bairro) {
    // Banco de dados mockado com cronogramas reais simulados
    final Map<String, List<Cronograma>> bancoCronogramas = {
      'Centro': [
        Cronograma(bairro: 'Centro', diaSemana: 'Segunda-feira', horario: '07:00 - Manhã'),
        Cronograma(bairro: 'Centro', diaSemana: 'Quinta-feira', horario: '19:00 - Noite'),
      ],
      'Fazenda': [
        Cronograma(bairro: 'Fazenda', diaSemana: 'Terça-feira', horario: '13:30 - Tarde'),
        Cronograma(bairro: 'Fazenda', diaSemana: 'Sexta-feira', horario: '13:30 - Tarde'),
      ],
      'Cordeiros': [
        Cronograma(bairro: 'Cordeiros', diaSemana: 'Quarta-feira', horario: '19:00 - Noite'),
        Cronograma(bairro: 'Cordeiros', diaSemana: 'Sábado', horario: '07:00 - Manhã'),
      ],
      'Praia Brava': [
        Cronograma(bairro: 'Praia Brava', diaSemana: 'Segunda-feira', horario: '14:00 - Tarde'),
      ],
      'Cabeçudas': [
        Cronograma(bairro: 'Cabeçudas', diaSemana: 'Quarta-feira', horario: '08:00 - Manhã'),
      ],
      'São Vicente': [
        Cronograma(bairro: 'São Vicente', diaSemana: 'Terça-feira', horario: '08:00 - Manhã'),
        Cronograma(bairro: 'São Vicente', diaSemana: 'Sexta-feira', horario: '08:00 - Manhã'),
      ],
      'Limoeiro': [
        Cronograma(bairro: 'Limoeiro', diaSemana: 'Segunda-feira', horario: '09:00 - Manhã'),
        Cronograma(bairro: 'Limoeiro', diaSemana: 'Quinta-feira', horario: '09:00 - Manhã'),
      ],
      'Barra do Rio': [
        Cronograma(bairro: 'Barra do Rio', diaSemana: 'Quinta-feira', horario: '15:00 - Tarde'),
      ],
    };

    // Retorna a lista do bairro específico ou uma lista vazia se não encontrar
    return bancoCronogramas[bairro] ?? [];
  }
}