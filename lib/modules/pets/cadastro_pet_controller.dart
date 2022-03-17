import 'package:flutter/material.dart';

class CadastroPetController {
  final listaCor = const [
    DropdownMenuItem(child: Text('Preto'), value: 'Preto'),
    DropdownMenuItem(child: Text('Branco'), value: 'Branco'),
    DropdownMenuItem(child: Text('Marrom'), value: 'Marrom'),
  ];

  final listaSexo = const [
    DropdownMenuItem(child: Text('Macho'), value: 'Macho'),
    DropdownMenuItem(child: Text('Femea'), value: 'Femea'),
  ];

  final nomeController = TextEditingController();
  final descricaoController = TextEditingController();
  final bioController = TextEditingController();
  final idadeController = TextEditingController();
  String? sexo;
  String? cor;
}
