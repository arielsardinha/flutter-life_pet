import 'package:flutter/cupertino.dart';
import 'package:life_pet/models/pet_model.dart';

class RemedioController {
  Future<void> acessCadastroPet(
      {required BuildContext context, required Pet pet}) async {
    Navigator.of(context).pushNamed('/cadastroRemedio', arguments: pet);
  }
}
