import 'package:flutter/material.dart';
import 'package:life_pet/components/costom_app_bar.dart';
import 'package:life_pet/modules/pets/perfil/perfil_pet_controller.dart';

class PerfilPetView extends StatelessWidget {
  const PerfilPetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petId = ModalRoute.of(context)!.settings.arguments as int;
    final controller = PerfilPetController(petId: petId);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  child: Image.memory(
                    controller.pet.imageUrl,
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
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.pet.nome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      controller.pet.descricao,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  cardItens(
                      label: 'Idade', value: controller.pet.idade.toString()),
                  cardItens(label: 'Sexo', value: controller.pet.sexo),
                  cardItens(label: 'Cor', value: controller.pet.cor),
                  cardItens(
                      label: 'Peso', value: controller.pet.peso.toString()),
                  cardItens(label: 'id', value: controller.pet.id.toString()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              child: Text(
                controller.pet.bio,
                style: const TextStyle(
                    fontFamily: 'Montserrat', fontSize: 16, height: 1.5),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.acessFormPet(context: context, petId: petId);
          },
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.edit,
            color: Colors.white,
          )),
      bottomNavigationBar:
          CustonAppBar(petId: controller.pet.id!, paginaAberta: 0),
    );
  }
}

Widget cardItens({required String label, required String value}) {
  return Row(
    children: [
      Container(
        width: 100,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ]),
      ),
    ],
  );
}
