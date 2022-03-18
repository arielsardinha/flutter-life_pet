import 'package:life_pet/models/remedio_model.dart';
import 'package:life_pet/services/pet_service.dart';

class RemedioService {
  final _listaRemedio = <Remedio>[];
  final PetService _petService = PetService();

  static final RemedioService _singleton = RemedioService._instance();

  factory RemedioService() {
    return _singleton;
  }

  RemedioService._instance() {
    _listaRemedio.add(
      Remedio(
        nome: 'RemedioX',
        data: '10/10/2024',
        pet: _petService.getFindPet(1),
      ),
    );
  }
}
