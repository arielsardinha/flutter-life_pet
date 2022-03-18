import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/services/pet_service.dart';

class HomeController {
  final _petService = PetService();
  HomeController() {
    pets = _petService.getAllPets();
  }
  var pets = <Pet>[];

  Future<void> acessPerfil(
      {required int index, required BuildContext context}) async {
    Navigator.of(context).pushNamed('/perfilPet', arguments: pets[index]);
  }
}
