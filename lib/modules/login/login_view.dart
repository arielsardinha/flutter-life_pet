import 'package:flutter/material.dart';
import 'package:life_pet/components/botao_animado/botao_animado.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.zero,
          child: ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90),
                  ),
                ),
                child: Column(
                  children: const [
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.pets, color: Colors.white, size: 90),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                margin: const EdgeInsets.only(top: 62),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      padding: const EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ],
                      ),
                      child: const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey,
                            ),
                            hintText: 'Email'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 5)
                        ],
                      ),
                      child: const TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Senha'),
                      ),
                    ),
                    const Spacer(),
                    const BotaoAnimado(),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
