import 'package:flutter/cupertino.dart';
import 'package:life_pet/services/pet_service.dart';
import 'package:life_pet/services/remedio_service.dart';

class RemedioController {
  final PetService petService = PetService();
  final RemedioService remedioService = RemedioService();
  Future<void> acessCadastroPet(
      {required BuildContext context, required int petId}) async {
    Navigator.of(context).pushNamed('/cadastroRemedio', arguments: petId);
  }
}
