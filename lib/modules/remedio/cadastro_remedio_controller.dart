import 'package:flutter/material.dart';
import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/services/remedio_service.dart';

class CadastroRemedioController {
  final nomeController = TextEditingController();
  var dataController = TextEditingController();
  var loading = ValueNotifier(false);

  var dataSelecionada = DateTime.now();
  final RemedioService _remedioService = RemedioService();

  String? validateFormTextFiel(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'O campo é obrigatório';
    }
  }

  Future<void> addNewRemedio(
      {required int petId, required BuildContext context}) async {
    loading.value = true;
    await _remedioService.addNewRemedio(
      Remedio(nome: nomeController.text, data: dataSelecionada, petId: petId),
    );
    loading.value = false;

    Navigator.of(context).pop();
    Navigator.of(context).pushReplacementNamed('/remedio', arguments: petId);
  }
}
