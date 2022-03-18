import 'package:flutter/material.dart';

class CustonAppBar extends StatefulWidget {
  const CustonAppBar({Key? key}) : super(key: key);

  @override
  State<CustonAppBar> createState() => _CustonAppBarState();
}

class _CustonAppBarState extends State<CustonAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.pets,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(color: Colors.redAccent),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.healing,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Remedio',
                        style: TextStyle(color: Colors.redAccent),
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
                    children: const [
                      Icon(
                        Icons.local_hospital,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Consulta',
                        style: TextStyle(color: Colors.redAccent),
                      )
                    ],
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.event_note,
                        color: Colors.redAccent,
                      ),
                      Text(
                        'Anotacoes',
                        style: TextStyle(color: Colors.redAccent),
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
