import 'package:flutter/material.dart';
import 'package:life_pet/components/botao_animado/botao_controtroller.dart';

class BotaoAnimado extends StatefulWidget {
  const BotaoAnimado({Key? key}) : super(key: key);

  @override
  State<BotaoAnimado> createState() => _BotaoAnimadoState();
}

class _BotaoAnimadoState extends State<BotaoAnimado> {
  final controller = AnimacaoButton();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.animar();
      },
      child: AnimatedBuilder(
          animation: controller,
          builder: (context, snapshot) {
            return AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: 45,
              width: controller.width,
              decoration: const BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: Visibility(
                  visible: !controller.isFianl,
                  child: Text(
                    'login'.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  replacement: const CircularProgressIndicator(),
                ),
              ),
            );
          }),
    );
  }
}
