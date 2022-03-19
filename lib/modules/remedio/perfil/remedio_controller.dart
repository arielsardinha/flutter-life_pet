import 'package:flutter/cupertino.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/services/pet_service.dart';
import 'package:life_pet/services/remedio_service.dart';

class RemedioController {
  late Pet pet;
  late List<Remedio> listaRemedio;
  final PetService _petService = PetService();
  final RemedioService _remedioService = RemedioService();
  RemedioController({required int petId}) {
    pet = _petService.getFindPet(petId);

    listaRemedio = _remedioService.getAllRemedios(petId);
  }
  Future<void> acessCadastroPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed('/cadastroRemedio', arguments: petId);
  }
}
