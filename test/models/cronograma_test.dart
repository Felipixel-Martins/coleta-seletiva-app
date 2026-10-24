import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/models/cronograma.dart';

void main() {
  group('Modelo Cronograma', () {
    test('deve criar um cronograma válido', () {
      final cronograma = Cronograma(
        bairro: 'Centro',
        diaSemana: 'Segunda-feira',
        horario: '08:00',
      );
      expect(cronograma.bairro, 'Centro');
      expect(cronograma.diaSemana, 'Segunda-feira');
      expect(cronograma.horario, '08:00');
    });
  });
}