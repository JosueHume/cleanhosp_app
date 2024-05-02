
class Pessoa {
  final int pessoa_id;
  final String ds_nome;
  final int nr_cpf;
  final int nr_telefone;
  final String ds_email;
  final String ds_login;
  final String ds_senha;

  const Pessoa({
    required this.pessoa_id,
    required this.ds_nome,
    required this.nr_cpf,
    required this.nr_telefone,
    required this.ds_email,
    required this.ds_login,
    required this.ds_senha
  });

  const Pessoa.empty({
    this.pessoa_id = 0,
    this.ds_nome = '',
    this.nr_cpf = 0,
    this.nr_telefone = 0,
    this.ds_email = '',
    this.ds_login = '',
    this.ds_senha = '',
  });

  factory Pessoa.fromJson(Map<String, dynamic> json) => Pessoa(
    pessoa_id: json['pessoa_id'],
    ds_nome: json['ds_nome'],
    nr_cpf: json['nr_cpf'],
    nr_telefone: json['nr_telefone'],
    ds_email: json['ds_email'],
    ds_login: json['ds_login'],
    ds_senha: json['ds_senha'],
  );

  Map<String, dynamic> toJson() => {
    "pessoa_id": pessoa_id,
    "ds_nome": ds_nome,
    "nr_cpf": nr_cpf,
    "nr_telefone": nr_telefone,
    "ds_email": ds_email,
    "ds_login": ds_login,
    "ds_senha": ds_senha,
  };
}
