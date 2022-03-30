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
      data: json['data'],
      petId: json['petId'],
      id: json['id'],
    );
  }
}
