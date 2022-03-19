import 'package:flutter/cupertino.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/services/pet_service.dart';

class RemedioController {
  late Pet pet;
  final PetService _petService = PetService();
  RemedioController({required int petId}) {
    pet = _petService.getFindPet(petId);
  }
  Future<void> acessCadastroPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed('/cadastroRemedio', arguments: petId);
  }
}
