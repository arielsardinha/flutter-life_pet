class Remedio {
  String nome;
  DateTime data;
  int petId;
  int? id;

  Remedio(
      {required this.nome, required this.data, required this.petId, this.id});

  factory Remedio.fromMap(Map json) {
    return Remedio(
      nome: json['nome'],
      data: DateTime.fromMillisecondsSinceEpoch((json['data'] as int)),
      petId: json['petId'],
      id: json['id'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'nome': nome,
      'data': data.millisecondsSinceEpoch,
      'petId': petId,
      'id': id,
    };
  }
}
