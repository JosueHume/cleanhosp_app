
class Local {
  final int local_id;
  final int ala_id;
  final String ds_descricao;

  const Local({
    required this.local_id,
    required this.ala_id,
    required this.ds_descricao
  });

  const Local.empty({
    this.local_id = 0,
    this.ala_id = 0,
    this.ds_descricao = ''
  });

  factory Local.fromJson(Map<String, dynamic> json) => Local(
      local_id: json['limpeza_id'],
      ala_id: json['ala_id'],
      ds_descricao: json['ds_descricao']
  );

  Map<String, dynamic> toJson() => {
    "local_id": local_id,
    "ala_id": ala_id,
    "ds_descricao": ds_descricao
  };
}
