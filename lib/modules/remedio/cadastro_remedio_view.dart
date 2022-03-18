import 'package:flutter/material.dart';
import 'package:life_pet/modules/remedio/cadastro_remedio_controller.dart';

class CadastroRemedioView extends StatefulWidget {
  const CadastroRemedioView({Key? key}) : super(key: key);

  @override
  State<CadastroRemedioView> createState() => _CadastroRemedioViewState();
}

class _CadastroRemedioViewState extends State<CadastroRemedioView> {
  final _formKey = GlobalKey<FormState>();
  final controller = CadastroRemedioController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro remedio Pet'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    return controller.validateFormTextFiel(value);
                  },
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Nome do remedio',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent),
                  ),
                ),
                TextFormField(
                  validator: (value) => controller.validateFormTextFiel(value),
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                    labelText: 'Data do remedio',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.redAccent),
                    ),
                    labelStyle: TextStyle(color: Colors.redAccent),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20),
                  child: OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.validate();
                    },
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
      ),
    );
  }
}
