
class EquipamentosUtilizados {
  final int equipamentos_utilizados_id;
  final int equipamento_id;
  final int nr_tempoUso;
  final int LocalLimpezaModelolocalLimpeza_id;

  const EquipamentosUtilizados({
    required this.equipamentos_utilizados_id,
    required this.equipamento_id,
    required this.nr_tempoUso,
    required this.LocalLimpezaModelolocalLimpeza_id
  });

  const EquipamentosUtilizados.empty({
    this.equipamentos_utilizados_id = 0,
    this.equipamento_id = 0,
    this.nr_tempoUso = 0,
    this.LocalLimpezaModelolocalLimpeza_id = 0
  });

  factory EquipamentosUtilizados.fromJson(Map<String, dynamic> json) => EquipamentosUtilizados(
      equipamentos_utilizados_id: json['equipamentos_utilizados_id'],
      equipamento_id: json['equipamento_id'],
      nr_tempoUso: json['nr_tempoUso'],
      LocalLimpezaModelolocalLimpeza_id: json['LocalLimpezaModelolocalLimpeza_id']
  );

  Map<String, dynamic> toJson() => {
    "equipamentos_utilizados_id": equipamentos_utilizados_id,
    "equipamento_id": equipamento_id,
    "nr_tempoUso": nr_tempoUso,
    "LocalLimpezaModelolocalLimpeza_id": LocalLimpezaModelolocalLimpeza_id,
  };
}
