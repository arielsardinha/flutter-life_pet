class CadastroRemedioController {
  String? validateFormTextFiel(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    } else {
      return 'O campo é obrigatório';
    }
  }
}
