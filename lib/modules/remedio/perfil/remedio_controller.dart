import 'package:flutter/cupertino.dart';
import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/services/pet_service.dart';
import 'package:life_pet/services/remedio_service.dart';

class RemedioController {
  // late List<Remedio> listaRemedio;
  final PetService petService = PetService();
  // final RemedioService _remedioService = RemedioService();
  Future<void> acessCadastroPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed('/cadastroRemedio', arguments: petId);
  }
}
