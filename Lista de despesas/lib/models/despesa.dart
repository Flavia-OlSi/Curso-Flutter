class Despesa {
  final String descricao;
  final double valor;
  final DateTime data;

  Despesa({required this.descricao, required this.valor, required this.data});

  factory Despesa.fromJson(Map<String, dynamic> map) {
    return Despesa(
        descricao: map['descricao'],
        valor: double.parse(map['valor']),
        data: DateTime.parse(map['data']));
  }

  Map<String, dynamic> toJson() {
    return {
      "descricao": descricao,
      "valor": valor.toString(),
      "data": data.toString()
    };
  }
}
