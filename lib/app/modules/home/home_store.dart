import 'package:adopt_pet/app/shared/models/cats/cat_breed_model.dart';
import 'package:adopt_pet/app/shared/models/dogs/dog_breed_model.dart';
import 'package:adopt_pet/app/shared/service/server/server_repository.dart';
import 'package:adopt_pet/app/shared/service/server/server_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  PageController pageController = PageController(initialPage: 0);
  final IServerRepository _server = ServerRepository();

  List allBreeds = [];
  ObservableList filteredBreeds = ObservableList();

  Future<List<DogBreedModel>> getAllDogBreeds() async {
    return await _server.getAllDogsBreeds();
  }

  Future<List<CatBreedModel>> getAllCatsBreeds() async {
    return await _server.getAllCatsBreeds();
  }

  String filterText = "";

  @action
  void setFilter() {
    filteredBreeds.clear();
    filteredBreeds.addAll(allBreeds.where((element) {
      if (filterText == "") {
        return true;
      } else {
        return element.name!
            .trim()
            .toLowerCase()
            .contains(filterText.trim().toLowerCase());
      }
    }));
  }
}
