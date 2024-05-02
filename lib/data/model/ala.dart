
  class Ala {
    final int ala_id;
    final String ds_descricao;

    const Ala({
      required this.ala_id,
      required this.ds_descricao,
    });

    const Ala.empty({
      this.ala_id = 0,
      this.ds_descricao = ''
  });

    factory Ala.fromJson(Map<String, dynamic> json) => Ala(
          ala_id: json['ala_id'],
          ds_descricao: json['ds_descricao']
    );

    Map<String, dynamic> toJson() => {
      "ala_id": ala_id,
      "ds_descricao": ds_descricao
    };
  }
