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
    const colunas = [
      'id',
      'nome',
      'idade',
      'imageUrl',
      'descricao',
      'sexo',
      'cor',
      'bio',
      'peso'
    ];

    final dataList = await DbUtil.getDataId('pets',
        whereArgs: [petId], colunas: colunas, where: 'id = ?');
    return Pet.fromMap(dataList.first);
  }
}
