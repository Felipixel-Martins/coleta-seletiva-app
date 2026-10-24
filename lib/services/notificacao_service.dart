class NotificacaoService {
  bool _ativo = false;

  bool get ativo => _ativo;

  void toggle() {
    _ativo = !_ativo;
  }

  String get mensagem {
    return _ativo ? 'Lembretes ativados' : 'Lembretes desativados';
  }
}