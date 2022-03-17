import 'package:flutter/material.dart';
import 'package:life_pet/modules/pets/cadastro_pet_controller.dart';

class CadastroPetView extends StatefulWidget {
  const CadastroPetView({Key? key}) : super(key: key);

  @override
  State<CadastroPetView> createState() => _CadastroPetViewState();
}

class _CadastroPetViewState extends State<CadastroPetView> {
  final controller = CadastroPetController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro Pet'), backgroundColor: Colors.redAccent),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
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
                controller: controller.descricaoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Descricao",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent)),
              ),
              TextFormField(
                controller: controller.bioController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    labelText: "Bio",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent)),
              ),
              TextFormField(
                controller: controller.idadeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: "Idade",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent)),
              ),
              DropdownButtonFormField<String>(
                items: controller.listaSexo,
                onChanged: (value) {
                  controller.sexo = value;
                },
                decoration: const InputDecoration(
                  labelText: "Sexo",
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(255, 82, 82, 1)),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent),
                ),
              ),
              DropdownButtonFormField<String>(
                items: controller.listaCor,
                onChanged: (value) {
                  controller.cor = value;
                },
                decoration: const InputDecoration(
                  labelText: "Cor",
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(255, 82, 82, 1)),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(color: Colors.white),
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
    );
  }
}
