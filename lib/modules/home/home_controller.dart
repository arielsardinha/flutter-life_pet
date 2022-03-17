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
      id: 3,
    ),
  ];
}
