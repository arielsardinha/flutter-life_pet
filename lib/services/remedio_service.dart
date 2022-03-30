import 'dart:math';

import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/utils/util_db.dart';

class RemedioService {
  var _remedios = <Remedio>[];
  static final RemedioService _singleton = RemedioService._internal();

  factory RemedioService() {
    return _singleton;
  }

  RemedioService._internal();

  Future<void> addNewRemedio(Remedio remedio) async {
    await DbUtil.insertData('remedios', data: remedio.toMap());
  }

  Future<List<Remedio>> getAllRemedios(int petId) async {
    const colunas = ['id', 'nome', 'data', 'petId'];

    final dataList = await DbUtil.getDataId('remedios',
        whereArgs: [petId], where: 'petId = ?', colunas: colunas);

    return dataList.map((map) => Remedio.fromMap(map)).toList();
  }
}
