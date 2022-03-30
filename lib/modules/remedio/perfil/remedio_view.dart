import 'package:flutter/material.dart';
import 'package:life_pet/components/costom_app_bar.dart';
import 'package:life_pet/mixins/format_date.dart';
import 'package:life_pet/models/pet_model.dart';
import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/modules/remedio/perfil/remedio_controller.dart';

class RemedioView extends StatelessWidget with FormatDateMixin {
  RemedioView({Key? key}) : super(key: key);
  final controller = RemedioController();

  @override
  Widget build(BuildContext context) {
    final petId = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: FutureBuilder<List>(
          future: Future.wait([
            controller.petService.getFindPet(petId),
            controller.remedioService.getAllRemedios(petId),
          ]),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final pet = snapshot.data![0] as Pet;
              final listaRemedios = snapshot.data![1] as List<Remedio>;
              return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        child: Image.memory(
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 20),
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
                  Visibility(
                    visible: listaRemedios.isNotEmpty,
                    child: Expanded(
                      child: ListView.builder(
                        itemCount: listaRemedios.length,
                        itemBuilder: (ctx, i) {
                          final remedio = listaRemedios[i];
                          return cardRemedio(
                            titulo: remedio.nome,
                            descricao: convertDateToString(remedio.data),
                          );
                        },
                      ),
                    ),
                    replacement: cardRemedio(
                        titulo: 'Não tem nenhum remedio', descricao: ''),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              controller.acessCadastroPet(context: context, petId: petId),
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      bottomNavigationBar: CustonAppBar(petId: petId, paginaAberta: 1),
    );
  }
}

Widget cardRemedio({required String titulo, required String descricao}) {
  return Card(
    elevation: 8.0,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
      leading: Container(
        padding: const EdgeInsets.only(right: 12),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.redAccent),
          ),
        ),
        child: const Icon(Icons.healing, color: Colors.redAccent),
      ),
      title: Text(
        titulo,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
      subtitle: Text(descricao),
    ),
  );
}
