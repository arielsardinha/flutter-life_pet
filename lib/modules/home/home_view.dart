import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/modules/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pet>>(
          future: controller.petService.getAllPets(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final pets = snapshot.data!;
              return ListView.builder(
                itemCount: pets.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () =>
                        controller.acessPerfil(index: index, context: context),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: pets[index].id!,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 250,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Image.memory(pets[index].imageUrl,
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pets[index].nome,
                                  style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text(
                                    pets[index].descricao,
                                    style: const TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 16,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          controller.acessFormPet(context: context);
        },
        label: const Text("Cadastrar"),
        icon: const Icon(Icons.pets),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}
