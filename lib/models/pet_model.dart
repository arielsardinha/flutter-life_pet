import 'dart:typed_data';
import 'package:life_pet/models/remedio_model.dart';

class Pet {
  String nome, descricao, cor, bio, sexo;
  Uint8List imageUrl;
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

  Map<String, Object?> toMap() {
    return {
      "id": id,
      "nome": nome,
      'descricao': descricao,
      "idade": idade,
      "sexo": sexo,
      "cor": cor,
      "bio": bio,
      "peso": peso,
      "imageUrl": imageUrl,
    };
  }

  factory Pet.fromMap(Map json) {
    return Pet(
      nome: json['nome'],
      descricao: json['descricao'],
      cor: json['cor'],
      bio: json['bio'],
      imageUrl: json['imageUrl'],
      idade: json['idade'],
      sexo: json['sexo'],
      peso: json['peso'],
    );
  }
}
