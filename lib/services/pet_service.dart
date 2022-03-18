import 'package:life_pet/models/pet_model.dart';

class PetService {
  final _listaPet = <Pet>[
    Pet(
      nome: "Toto",
      descricao: "Um cachorro esperto",
      cor: "Preto",
      bio: "Um totó bem esperto",
      imageUrl: "assets/images/toto.png",
      idade: 2,
      sexo: "Macho",
      peso: 3.2,
      id: 1,
    ),
    Pet(
      nome: "Arnaldo",
      descricao: "Pincher elétrico",
      cor: "Preto",
      bio: "Sou um pincher elétrico",
      imageUrl: "assets/images/arnaldo.png",
      idade: 3,
      sexo: "Macho",
      peso: 5.4,
      id: 2,
    ),
  ];

  List<Pet> getAllPets() {
    return _listaPet;
  }

  void addNewPet(Pet pet) {
    _listaPet.add(pet);
  }
}
