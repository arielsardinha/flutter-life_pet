import 'package:flutter/material.dart';
import 'package:life_pet/models/pet_model.dart';

class CustonAppBar extends StatefulWidget {
  CustonAppBar({Key? key, required this.pet, required this.paginaAberta})
      : super(key: key);
  int paginaAberta;
  final Pet pet;

  @override
  State<CustonAppBar> createState() => _CustonAppBarState();
}

class _CustonAppBarState extends State<CustonAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/perfilPet', arguments: widget.pet);
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.pets,
                        color: widget.paginaAberta == 0
                            ? Colors.redAccent
                            : Colors.grey,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(
                          color: widget.paginaAberta == 0
                              ? Colors.redAccent
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed('/remedio', arguments: widget.pet);
                  },
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.healing,
                        color: widget.paginaAberta == 1
                            ? Colors.redAccent
                            : Colors.grey,
                      ),
                      Text(
                        'Remedio',
                        style: TextStyle(
                          color: widget.paginaAberta == 1
                              ? Colors.redAccent
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: widget.paginaAberta == 2
                            ? Colors.redAccent
                            : Colors.grey,
                      ),
                      Text(
                        'Consulta',
                        style: TextStyle(
                            color: widget.paginaAberta == 2
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.event_note,
                        color: widget.paginaAberta == 3
                            ? Colors.redAccent
                            : Colors.grey,
                      ),
                      Text(
                        'Anotacoes',
                        style: TextStyle(
                            color: widget.paginaAberta == 3
                                ? Colors.redAccent
                                : Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
