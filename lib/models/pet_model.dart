class Pet {
  String nome, descricao, cor, bio, imageUrl, sexo;
  int idade;
  int? id;

  Pet({
    required this.nome,
    required this.descricao,
    required this.cor,
    required this.bio,
    required this.imageUrl,
    required this.idade,
    required this.sexo,
    this.id,
  });
}
