import 'dart:io';

import 'package:flutter/material.dart';
import 'package:life_pet/modules/pets/cadastro_pet_controller.dart';

class CadastroPetView extends StatefulWidget {
  final int? petId;
  const CadastroPetView({Key? key, this.petId}) : super(key: key);

  @override
  State<CadastroPetView> createState() => _CadastroPetViewState();
}

class _CadastroPetViewState extends State<CadastroPetView> {
  final controller = CadastroPetController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    controller.notifyValueImage.addListener(() {
      setState(() {});
    });
    controller.loading.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: controller.getFindPet(widget.petId),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
                title: Visibility(
                  visible: controller.pet == null,
                  child: const Text('Cadastro Pet'),
                  replacement: Text("Editar O ${controller.pet?.nome}"),
                ),
                backgroundColor: Colors.redAccent),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) =>
                            controller.validateFormTextFiel(value),
                        controller: controller.nomeController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Nome do Pet",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelStyle: TextStyle(color: Colors.redAccent)),
                      ),
                      TextFormField(
                        validator: (value) {
                          return controller.validateFormTextFiel(value);
                        },
                        controller: controller.descricaoController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Descricao",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelStyle: TextStyle(color: Colors.redAccent)),
                      ),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 150),
                        child: TextFormField(
                          maxLines: null,
                          validator: controller.validateFormTextFiel,
                          controller: controller.bioController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              labelText: "Bio",
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.redAccent),
                              ),
                              labelStyle: TextStyle(color: Colors.redAccent)),
                        ),
                      ),
                      TextFormField(
                        validator: controller.validateFormTextFiel,
                        controller: controller.idadeController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Idade",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelStyle: TextStyle(color: Colors.redAccent)),
                      ),
                      TextFormField(
                        validator: controller.validateFormTextFiel,
                        controller: controller.pesoController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: "Peso",
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.redAccent),
                            ),
                            labelStyle: TextStyle(color: Colors.redAccent)),
                      ),
                      DropdownButtonFormField<String>(
                        value: controller.sexo,
                        validator: controller.validateFormTextFiel,
                        items: controller.listaSexo,
                        onChanged: (value) {
                          controller.sexo = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Sexo",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 82, 82, 1)),
                          ),
                          labelStyle: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      DropdownButtonFormField<String>(
                        value: controller.cor,
                        validator: controller.validateFormTextFiel,
                        items: controller.listaCor,
                        onChanged: (value) {
                          controller.cor = value;
                        },
                        decoration: const InputDecoration(
                          labelText: "Cor",
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(255, 82, 82, 1)),
                          ),
                          labelStyle: TextStyle(color: Colors.redAccent),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Text(
                          controller.notifyValueImage.value,
                          style: const TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Visibility(
                        visible: controller.image.isNotEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.memory(controller.image),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await controller.acessGalery();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.redAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await controller.acessCam();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.photo_camera_back_outlined,
                                color: Colors.redAccent,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.clearImage();
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(top: 20),
                        child: OutlinedButton(
                          onPressed: () {
                            final isFormValid =
                                _formKey.currentState?.validate() ?? false;
                            final isImageValid = controller.validateImage();
                            if (isFormValid && isImageValid) {
                              if (widget.petId == null) {
                                controller.petAdd(context);
                              } else {
                                controller.editPet(context);
                              }
                            }
                          },
                          child: Visibility(
                            visible: !controller.loading.value,
                            child: Text(
                              widget.petId == null ? 'Cadastrar' : 'Editar',
                              style: const TextStyle(color: Colors.white),
                            ),
                            replacement: const CircularProgressIndicator(),
                          ),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.redAccent),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
