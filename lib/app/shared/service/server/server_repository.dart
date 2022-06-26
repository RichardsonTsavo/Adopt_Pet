import 'package:adopt_pet/app/shared/models/cats/cat_breed_model.dart';
import 'package:adopt_pet/app/shared/models/dogs/dog_breed_model.dart';
import 'package:adopt_pet/app/shared/service/server/server_repository_interface.dart';
import 'package:adopt_pet/app/shared/utils/endpoit/endpoint.dart';
import 'package:adopt_pet/app/shared/utils/snackbar/global_snack_bar.dart';
import 'package:dio/dio.dart';

class ServerRepository implements IServerRepository {
  GlobalSnackBar snackBar = const GlobalSnackBar();
  Dio dio = Dio();

  @override
  Future getAllDogsBreeds() async {
    try {
      Response response = await dio.get(dogEndpoit() + "breeds",
          queryParameters: {"Content-Type": "application/json; charset=utf-8"});
      List<DogBreedModel> dogBreeds = [];
      for (var element in response.data) {
        dogBreeds.add(DogBreedModel.fromMap(element as Map<String, dynamic>));
      }
      return dogBreeds;
    } catch (onError) {
      snackBar.showErrorSnackbar("Erro ao carregar infomações das raças");
    }
  }

  @override
  Future getAllCatsBreeds() async {
    try {
      Response response = await dio.get(catEndpoit() + "breeds",
          queryParameters: {"Content-Type": "application/json; charset=utf-8"});
      List<CatBreedModel> catBreeds = [];
      for (var element in response.data) {
        catBreeds.add(CatBreedModel.fromMap(element as Map<String, dynamic>));
      }
      return catBreeds;
    } catch (onError) {
      snackBar.showErrorSnackbar("Erro ao carregar infomações das raças");
    }
  }
}
