import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';

class RemedioView extends StatelessWidget {
  const RemedioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pet = ModalRoute.of(context)!.settings.arguments as Pet;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Image.asset(
                    pet.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
                  child: CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Row(
                children: const [
                  Text(
                    'Remédio',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
