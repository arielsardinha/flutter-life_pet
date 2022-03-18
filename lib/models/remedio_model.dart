import 'package:life_pet/models/pet_model.dart';

class Remedio {
  String nome, data;
  int? id;
  Pet pet;

  Remedio({required this.nome, required this.data, required this.pet, this.id});
}
