import 'dart:math';

import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/utils/util_db.dart';

class PetService {
  var _listaPet = <Pet>[];
  static final PetService _singleton = PetService._internal();

  factory PetService() {
    return _singleton;
  }

  PetService._internal();

  List<Pet> getAllPets() {
    return _listaPet;
  }

  void editPet(Pet newPet) {
    _listaPet = _listaPet.map((pet) {
      if (newPet.id == pet.id) {
        return newPet;
      }
      return pet;
    }).toList();
  }

  void addNewPet(Pet pet) {
    final data = {
      "nome": pet.nome,
      'descricao': pet.descricao,
      "idade": pet.idade,
      "sexo": pet.sexo,
      "cor": pet.cor,
      "bio": pet.bio,
      "peso": pet.peso,
      "imageUrl": pet.imageUrl,
    };
    DbUtil.insertData('pets', data);
  }

  Pet getFindPet(int petId) {
    return _listaPet.singleWhere((pet) => pet.id == petId);
  }
}
