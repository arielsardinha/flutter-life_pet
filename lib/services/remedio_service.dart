import 'dart:math';

import 'package:life_pet/models/remedio_model.dart';

class RemedioService {
  var _remedios = <Remedio>[];
  static final RemedioService _singleton = RemedioService._internal();

  factory RemedioService() {
    return _singleton;
  }

  RemedioService._internal();

  void addNewRemedio(Remedio remedio) {
    _remedios.add(
      Remedio(
        nome: remedio.nome,
        data: remedio.data,
        petId: remedio.petId,
        id: Random().nextInt(1000),
      ),
    );
  }

  List<Remedio> getAllRemedios(int petId) {
    return _remedios.where((remedio) => remedio.petId == petId).toList();
  }
}
