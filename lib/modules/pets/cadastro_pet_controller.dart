import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroPetController {
  final ImagePicker _imagePicker = ImagePicker();

  File image = File('');

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

  Future<void> acessGalery() async {
    final XFile? _image =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      image = File(_image.path);
    }
  }

  Future<void> acessCam() async {
    final XFile? _image =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (_image != null) {
      image = File(_image.path);
    }
  }

  void clearImage() {
    image = File('');
  }
}
