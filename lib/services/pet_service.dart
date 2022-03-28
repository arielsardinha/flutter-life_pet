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

  Future<List<Pet>> getAllPets() async {
    final json = await DbUtil.getData('pets');
    print(json.map((map) => Pet.fromMap(map)).toList());
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
    DbUtil.insertData('pets', pet.toMap());
  }

  Pet getFindPet(int petId) {
    return _listaPet.singleWhere((pet) => pet.id == petId);
  }
}
