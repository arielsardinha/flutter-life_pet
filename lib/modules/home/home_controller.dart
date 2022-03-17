import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';

class HomeController {
  var pets = <Pet>[
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
    Pet(
      nome: "Paulinho",
      descricao: "Pincher elétrico",
      cor: "Preto",
      bio: "Sou um pincher elétrico",
      imageUrl: "assets/images/arnaldo.png",
      idade: 1,
      sexo: "Macho",
      peso: 12.3,
      id: 3,
    ),
  ];

  Future<void> acessPerfil(
      {required int index, required BuildContext context}) async {
    Navigator.of(context).pushNamed('/perfilPet', arguments: pets[index]);
  }
}
