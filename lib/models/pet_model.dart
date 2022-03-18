import 'dart:io';

import 'package:life_pet/models/remedio_model.dart';

class Pet {
  String nome, descricao, cor, bio, sexo;
  File imageUrl;
  int idade;
  List<Remedio> remedios;
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
    this.remedios = const [],
    this.id,
  });
}
