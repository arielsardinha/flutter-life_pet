import 'dart:io';

class Pet {
  String nome, descricao, cor, bio, sexo;
  File imageUrl;
  int idade;
  double peso;
  int? id;

  Pet({
    required this.nome,
    required this.descricao,
    required this.cor,
    required this.bio,
    required this.imageUrl,
    required this.idade,
    required this.sexo,
    required this.peso,
    this.id,
  });
}
