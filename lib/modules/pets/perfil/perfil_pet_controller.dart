import 'package:flutter/cupertino.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/services/pet_service.dart';

class PerfilPetController {
  late Pet pet;
  final PetService _petService = PetService();
  PerfilPetController({required int petId}) {
    pet = _petService.getFindPet(petId);
  }

  Future<void> acessFormPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed("/cadastroPet", arguments: petId);
  }
}
