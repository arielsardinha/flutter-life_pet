import 'package:flutter/material.dart';
import 'package:life_pet/components/costom_app_bar.dart';
import 'package:life_pet/mixins/format_date.dart';
import 'package:life_pet/modules/remedio/perfil/remedio_controller.dart';

class RemedioView extends StatelessWidget with FormatDateMixin {
  RemedioView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final petId = ModalRoute.of(context)!.settings.arguments as int;
    final controller = RemedioController(petId: petId);
    return Scaffold(
      body: Column(
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
          Expanded(
            child: ListView.builder(
              itemCount: controller.listaRemedio.length,
              itemBuilder: (ctx, i) {
                final remedio = controller.listaRemedio[i];
                return cardRemedio(
                  titulo: remedio.nome,
                  descricao: convertDateToString(remedio.data),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: () =>
              controller.acessCadastroPet(context: context, petId: petId),
          backgroundColor: Colors.redAccent,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      bottomNavigationBar:
          CustonAppBar(petId: controller.pet.id!, paginaAberta: 1),
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
