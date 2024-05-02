class Produto {
  final int produto_id;
  final String ds_nome;
  final String ds_marca;
  final String ds_descricao;
  final int qtde_estoque;
  final double vl_unitario;

  const Produto({
    required this.produto_id,
    required this.ds_nome,
    required this.ds_marca,
    required this.ds_descricao,
    required this.qtde_estoque,
    required this.vl_unitario,
  });

  const Produto.empty({
    this.produto_id = 0,
    this.ds_nome = '',
    this.ds_marca = '',
    this.ds_descricao = '',
    this.qtde_estoque = 0,
    this.vl_unitario = 0,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => Produto(
    produto_id: json['produto_id'],
    ds_nome: json['ds_nome'],
    ds_marca: json['ds_marca'],
    ds_descricao: json['ds_descricao'],
    qtde_estoque: json['qtde_estoque'],
    vl_unitario: json['vl_unitario'],
  );

  Map<String, dynamic> toJson() => {
    "produto_id": produto_id,
    "ds_nome": ds_nome,
    "ds_marca": ds_marca,
    "ds_descricao": ds_descricao,
    "qtde_estoque": qtde_estoque,
    "vl_unitario": vl_unitario,
  };
}
