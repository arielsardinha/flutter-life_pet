import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/services/pet_service.dart';

class HomeController {
  final petService = PetService();

  Future<void> acessPerfil(
      {required int index,
      required BuildContext context,
      required int petId}) async {
    Navigator.of(context).pushNamed('/perfilPet', arguments: petId);
  }

  Future<void> acessFormPet({required BuildContext context}) async {
    Navigator.of(context).pushNamed('/cadastroPet');
  }
}
