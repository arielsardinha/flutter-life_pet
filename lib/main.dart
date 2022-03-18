import 'package:flutter/material.dart';
import 'package:life_pet/modules/home/home_view.dart';
import 'package:life_pet/modules/pets/cadastr_pet_view.dart';
import 'package:life_pet/modules/pets/perfil/perfil_pet_view.dart';
import 'package:life_pet/modules/remedio/cadastro_remedio_view.dart';
import 'package:life_pet/modules/remedio/perfil/remedio_view.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Life Pet',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeView(),
        '/cadastroPet': (context) => const CadastroPetView(),
        "/perfilPet": (context) => const PerfilPetView(),
        "/remedio": (context) => RemedioView(),
        "/cadastroRemedio": (context) => const CadastroRemedioView(),
      },
    );
  }
}
