import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_pet/modules/home/home_view.dart';
import 'package:life_pet/modules/pets/cadastr_pet_view.dart';

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
        '/home': (context) => const HomeView(),
        '/cadastroPet': (context) => const CadastroPetView(),
      },
    );
  }
}
