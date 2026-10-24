import 'package:flutter_test/flutter_test.dart';
import 'package:coleta_seletiva_app/services/notificacao_service.dart';

void main() {
  test('Deve alternar o estado da notificacao', () {
    final service = NotificacaoService();
    expect(service.ativo, false);
    service.toggle();
    expect(service.ativo, true);
    expect(service.mensagem, 'Lembretes ativados');
  });
}