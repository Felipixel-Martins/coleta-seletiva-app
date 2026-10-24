/// Representa o morador cadastrado no aplicativo.
///
/// A validação acontece no construtor: um [Usuario] só existe
/// se tiver nome preenchido e e-mail em formato válido.
class Usuario {
  final String nome;
  final String email;
  final String bairro;

  static final RegExp _regexEmail = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');

  Usuario({
    required String nome,
    required String email,
    required this.bairro,
  })  : nome = nome.trim(),
        email = email.trim() {
    if (!nomeValido(this.nome)) {
      throw ArgumentError('O nome não pode ficar vazio.');
    }
    if (!emailValido(this.email)) {
      throw ArgumentError('E-mail inválido.');
    }
  }

  /// Verifica se o nome informado é válido (não vazio).
  static bool nomeValido(String nome) => nome.trim().isNotEmpty;

  /// Verifica se o e-mail informado tem formato válido.
  static bool emailValido(String email) => _regexEmail.hasMatch(email.trim());

  Map<String, dynamic> toMap() =>
      {'nome': nome, 'email': email, 'bairro': bairro};

  factory Usuario.fromMap(Map<String, dynamic> map) => Usuario(
        nome: map['nome'] as String,
        email: map['email'] as String,
        bairro: map['bairro'] as String,
      );

  @override
  bool operator ==(Object other) =>
      other is Usuario &&
      other.nome == nome &&
      other.email == email &&
      other.bairro == bairro;

  @override
  int get hashCode => Object.hash(nome, email, bairro);
}
