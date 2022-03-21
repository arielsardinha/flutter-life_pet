import 'package:flutter/cupertino.dart';

class AnimacaoButton extends ChangeNotifier {
  double width = 330;
  bool isFianl = false;

  Future<void> animar() async {
    width = 45;
    notifyListeners();
    await Future.delayed(Duration(seconds: 2));
    isFianl = true;
    notifyListeners();
  }
}
