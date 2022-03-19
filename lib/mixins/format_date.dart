mixin FormatDateMixin {
  String convertDateToString(DateTime data) {
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    final ano = data.year;
    return "$dia/$mes/$ano";
  }
}
