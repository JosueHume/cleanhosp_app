
class Equipamento {
  final int equipamento_id;
  final String ds_nome;
  final String ds_marca;
  final String ds_modelo;
  final DateTime? dt_aquisicao;
  final String ds_descricao;
  final bool xAtivo;

  const Equipamento({
    required this.equipamento_id,
    required this.ds_nome,
    required this.ds_marca,
    required this.ds_modelo,
    this.dt_aquisicao,
    required this.ds_descricao,
    required this.xAtivo,
  });

  const Equipamento.empty({
    this.equipamento_id = 0,
    this.ds_nome = '',
    this.ds_marca = '',
    this.ds_modelo = '',
    this.dt_aquisicao = null,
    this.ds_descricao = '',
    this.xAtivo = false,
  });

  factory Equipamento.fromJson(Map<String, dynamic> json) => Equipamento(
      equipamento_id: json['equipamento_id'],
      ds_nome: json['ds_nome'],
      ds_marca: json['ds_marca'],
      ds_modelo: json['ds_modelo'],
      dt_aquisicao: json['dt_aquisicao'],
      ds_descricao: json['ds_descricao'],
      xAtivo: json['xAtivo'],
  );

  Map<String, dynamic> toJson() => {
    "equipamento_id": equipamento_id,
    "ds_nome": ds_nome,
    "ds_marca": ds_marca,
    "ds_modelo": ds_modelo,
    "dt_aquisicao": dt_aquisicao,
    "ds_descricao": ds_descricao,
    "xAtivo": xAtivo,
  };
}
