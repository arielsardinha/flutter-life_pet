import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:life_pet/modules/home/home_view.dart';

void main() => runApp(const Main());

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Life Pet',
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
