
class Limpeza {
  final int limpeza_id;
  final String ds_descricao;

  const Limpeza({
    required this.limpeza_id,
    required this.ds_descricao
  });

  const Limpeza.empty({
    this.limpeza_id = 0,
    this.ds_descricao = ''
  });

  factory Limpeza.fromJson(Map<String, dynamic> json) => Limpeza(
      limpeza_id: json['limpeza_id'],
      ds_descricao: json['ds_descricao']
  );

  Map<String, dynamic> toJson() => {
    "limpeza_id": limpeza_id,
    "ds_descricao": ds_descricao
  };
}
