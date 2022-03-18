import 'package:flutter/material.dart';

class CadastroRemedioView extends StatefulWidget {
  const CadastroRemedioView({Key? key}) : super(key: key);

  @override
  State<CadastroRemedioView> createState() => _CadastroRemedioViewState();
}

class _CadastroRemedioViewState extends State<CadastroRemedioView> {
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
            child: Column(
              children: [
                TextFormField(
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
      ),
    );
  }
}
