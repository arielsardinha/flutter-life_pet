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

var pets = <Pet>[
  Pet(
    nome: "Toto",
    descricao: "Um cachorro esperto",
    cor: "Preto",
    bio: "Um totó bem esperto",
    imageUrl: "assets/images/toto.png",
    idade: 2,
    sexo: "Macho",
    id: 1,
  ),
  Pet(
    nome: "Arnaldo",
    descricao: "Pincher elétrico",
    cor: "Preto",
    bio: "Sou um pincher elétrico",
    imageUrl: "assets/images/arnaldo.png",
    idade: 3,
    sexo: "Macho",
    id: 2,
  ),
];
