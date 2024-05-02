
class LocalLimpeza {
  final int localLimpeza_id;
  final int ala_id;
  final int pessoa_id;
  final DateTime? dt_inicio;
  final DateTime? dt_fim;
  final int limpeza_id;
  final int produtos_utilizados_id;
  final String ds_descricao;
  final int status;

  const LocalLimpeza({
    required this.localLimpeza_id,
    required this.ala_id,
    required this.pessoa_id,
    this.dt_inicio,
    this.dt_fim,
    required this.limpeza_id,
    required this.produtos_utilizados_id,
    required this.ds_descricao,
    required this.status
  });

  const LocalLimpeza.empty({
    this.localLimpeza_id = 0,
    this.ala_id = 0,
    this.pessoa_id = 0,
    this.dt_inicio = null,
    this.dt_fim = null,
    this.limpeza_id = 0,
    this.produtos_utilizados_id = 0,
    this.ds_descricao = '',
    this.status = 0
  });

  factory LocalLimpeza.fromJson(Map<String, dynamic> json) => LocalLimpeza(
      localLimpeza_id: json['localLimpeza_id'],
      ala_id: json['ala_id'],
      pessoa_id: json['pessoa_id'],
      dt_inicio: json['dt_inicio'],
      dt_fim: json['dt_fim'],
      limpeza_id: json['limpeza_id'],
      produtos_utilizados_id: json['produtos_utilizados_id'],
      ds_descricao: json['ds_descricao'],
      status: json['status'],
  );

  Map<String, dynamic> toJson() => {
    "localLimpeza_id": localLimpeza_id,
    "ala_id": ala_id,
    "pessoa_id": pessoa_id,
    "dt_inicio": dt_inicio,
    "dt_fim": dt_fim,
    "limpeza_id": limpeza_id,
    "produtos_utilizados_id": produtos_utilizados_id,
    "ds_descricao": ds_descricao,
    "status": status,
  };
}
