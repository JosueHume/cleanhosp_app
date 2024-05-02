
class ProdutosUtilizados {
  final int produtos_utilizados_id;
  final int quantidade;
  final int produto_id;
  final int LocalLimpezaModellocalLimpeza_id;

  const ProdutosUtilizados({
    required this.produtos_utilizados_id,
    required this.quantidade,
    required this.produto_id,
    required this.LocalLimpezaModellocalLimpeza_id
  });

  const ProdutosUtilizados.empty({
    this.produtos_utilizados_id = 0,
    this.quantidade = 0,
    this.produto_id = 0,
    this.LocalLimpezaModellocalLimpeza_id = 0
  });

  factory ProdutosUtilizados.fromJson(Map<String, dynamic> json) => ProdutosUtilizados(
      produtos_utilizados_id: json['produtos_utilizados_id'],
      quantidade: json['quantidade'],
      produto_id: json['produto_id'],
      LocalLimpezaModellocalLimpeza_id: json['LocalLimpezaModellocalLimpeza_id']
  );

  Map<String, dynamic> toJson() => {
    "produtos_utilizados_id": produtos_utilizados_id,
    "quantidade": quantidade,
    "produto_id": produto_id,
    "LocalLimpezaModellocalLimpeza_id": LocalLimpezaModellocalLimpeza_id,
  };
}
