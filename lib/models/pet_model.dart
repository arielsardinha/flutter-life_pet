class Pet {
  String nome, descricao, cor, bio, imageUrl, sexo;
  int idade;
  double peso;
  int? id;

  Pet({
    required this.nome,
    required this.descricao,
    required this.cor,
    required this.bio,
    required this.imageUrl,
    required this.idade,
    required this.sexo,
    required this.peso,
    this.id,
  });
}
