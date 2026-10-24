import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/models/solicitacao.dart';

void main() {
  group('Modelo Solicitacao', () {
    test('deve criar uma solicitacao valida', () {
      final solicitacao = Solicitacao(
        motivo: 'Lixo acumulado',
        endereco: 'Rua das Flores, 123',
        data: DateTime(2026, 10, 24),
      );
      expect(solicitacao.motivo, 'Lixo acumulado');
      expect(solicitacao.endereco, 'Rua das Flores, 123');
    });
  });
}