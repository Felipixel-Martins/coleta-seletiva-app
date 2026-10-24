import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/services/cronograma_service.dart';

void main() {
  group('CronogramaService', () {
    test('deve retornar cronogramas para o bairro Centro', () {
      final service = CronogramaService();
      final resultado = service.obterCronogramaPorBairro('Centro');
      
      expect(resultado.isNotEmpty, true);
      expect(resultado.first.bairro, 'Centro');
    });

    test('deve retornar lista vazia para bairro inexistente', () {
      final service = CronogramaService();
      final resultado = service.obterCronogramaPorBairro('Bairro Fantasma');
      
      expect(resultado.isEmpty, true);
    });
  });
}