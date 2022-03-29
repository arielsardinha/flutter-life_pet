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
    final json = await DbUtil.getData();

    return json.map((map) => Pet.fromMap(map)).toList();
  }

  Future<void> editPet(Pet newPet) async {
    await DbUtil.editData(data: newPet.toMap(), whereArgs: [newPet.id]);
  }

  Future<void> addNewPet(Pet pet) async {
    await DbUtil.insertData(pet.toMap());
  }

  Future<Pet> getFindPet(int petId) async {
    final dataList = await DbUtil.getDataId(whereArgs: [petId]);
    return Pet.fromMap(dataList.first);
  }
}
