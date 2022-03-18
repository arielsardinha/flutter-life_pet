import 'dart:math';

import 'package:life_pet/models/pet_model.dart';

class PetService {
  final _listaPet = <Pet>[];
  static final PetService _singleton = PetService._internal();

  factory PetService() {
    return _singleton;
  }

  PetService._internal();

  List<Pet> getAllPets() {
    return _listaPet;
  }

  void addNewPet(Pet pet) {
    _listaPet.add(
      Pet(
        nome: pet.nome,
        descricao: pet.descricao,
        cor: pet.cor,
        bio: pet.bio,
        imageUrl: pet.imageUrl,
        idade: pet.idade,
        sexo: pet.sexo,
        peso: pet.peso,
        id: Random().nextInt(1000),
      ),
    );
  }

  Pet getFindPet(int petId) {
    return _listaPet.singleWhere((pet) => pet.id == petId);
  }
}
