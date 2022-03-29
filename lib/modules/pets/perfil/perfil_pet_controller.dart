import 'package:flutter/cupertino.dart';
import 'package:life_pet/services/pet_service.dart';

class PerfilPetController {
  final PetService petService = PetService();

  Future<void> acessFormPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed("/cadastroPet", arguments: petId);
  }
}
