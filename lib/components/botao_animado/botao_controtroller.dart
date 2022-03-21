import 'package:flutter/cupertino.dart';

class AnimacaoButton extends ChangeNotifier {
  double width = 330;
  bool isFianl = false;

  Future<void> animar(BuildContext context) async {
    width = 45;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));
    isFianl = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.of(context).pushReplacementNamed('/home');
  }
}
