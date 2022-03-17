import 'package:flutter/material.dart';

class CadastroPetView extends StatefulWidget {
  const CadastroPetView({Key? key}) : super(key: key);

  @override
  State<CadastroPetView> createState() => _CadastroPetViewState();
}

class _CadastroPetViewState extends State<CadastroPetView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Cadastro Pet'), backgroundColor: Colors.redAccent),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: "Nome do Pet",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent)),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: "Descricao",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent)),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: "Bio",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.redAccent),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent)),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                  labelText: "Sexo",
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(255, 82, 82, 1)),
                  ),
                  labelStyle: TextStyle(color: Colors.redAccent)),
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
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
