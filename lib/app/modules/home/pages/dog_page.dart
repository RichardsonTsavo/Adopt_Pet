import 'package:adopt_pet/app/modules/home/home_store.dart';
import 'package:adopt_pet/app/shared/models/dogs/dog_breed_model.dart';
import 'package:adopt_pet/app/shared/utils/custom_text_form_field/custom_text_form_field.dart';
import 'package:adopt_pet/app/shared/utils/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DogPage extends StatefulWidget {
  const DogPage({Key? key}) : super(key: key);

  @override
  State<DogPage> createState() => _DogPageState();
}

class _DogPageState extends State<DogPage> {
  HomeStore store = Modular.get();
  ConstStyle constStyle = Modular.get();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List<DogBreedModel>>(
        future: store.getAllDogBreeds(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text("Erro ao carregar informações dos cachorros"),
            ));
          }
          if (snapshot.hasData) {
            store.filterText = "";
            store.allBreeds.clear();
            store.allBreeds = snapshot.data!;
            store.setFilter();
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  CustomTextFormField(
                    cursorColor: constStyle.tertiaryColor,
                    textColor: constStyle.tertiaryColor,
                    hintColor: constStyle.tertiaryColor,
                    needTheSpace: false,
                    obscureText: false,
                    onChanged: (data) {
                      store.filterText = data;
                      store.setFilter();
                    },
                    maxLine: 1,
                    minLine: 1,
                    hint: "Filtro",
                    prefixIcon: Icon(
                      Icons.filter_alt,
                      color: constStyle.tertiaryColor,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: Observer(
                    builder: (context) => ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        titlePadding: EdgeInsets.zero,
                                        title: AppBar(
                                          automaticallyImplyLeading: false,
                                          backgroundColor:
                                              constStyle.secundaryColor,
                                          actions: [
                                            IconButton(
                                              icon: Icon(
                                                  Icons
                                                      .disabled_by_default_rounded,
                                                  color:
                                                      constStyle.tertiaryColor),
                                              onPressed: () {
                                                Modular.to.pop();
                                              },
                                            )
                                          ],
                                          iconTheme: IconThemeData(
                                              color: constStyle.tertiaryColor),
                                          title: Text(
                                            "DETALHAMENTO",
                                            style: TextStyle(
                                                color:
                                                    constStyle.tertiaryColor),
                                          ),
                                          centerTitle: true,
                                        ),
                                        scrollable: true,
                                        content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                  width: constraints.maxWidth *
                                                      0.7,
                                                  height: constraints.maxWidth *
                                                      0.7,
                                                  child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: FadeInImage
                                                          .assetNetwork(
                                                        image: store
                                                            .filteredBreeds[
                                                                index]
                                                            .image!,
                                                        placeholder:
                                                            constStyle.logo,
                                                        fit: BoxFit.cover,
                                                      ))),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Nome: ${store.filteredBreeds[index].name!}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Peso: \n - Imperial: ${store.filteredBreeds[index].weight!.imperial} \n - Metric: ${store.filteredBreeds[index].weight!.metric}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Altura: \n - Imperial: ${store.filteredBreeds[index].height!.imperial} \n - Metric: ${store.filteredBreeds[index].height!.metric}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Criado para: ${store.filteredBreeds[index].bredFor!}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Grupo da raça: ${store.filteredBreeds[index].breedGroup}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Tempo de vida: ${store.filteredBreeds[index].lifeSpan}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Temperamento: ${store.filteredBreeds[index].temperament}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                              ListTile(
                                                leading: Icon(Icons.pets,
                                                    color: constStyle
                                                        .secundaryColor),
                                                title: Text(
                                                  "Origem: ${store.filteredBreeds[index].origin ?? "Não idendificado"}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          constraints.maxWidth *
                                                              0.04),
                                                ),
                                              ),
                                            ]),
                                      ));
                            },
                            leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    store.filteredBreeds[index].image!)),
                            title: Text(store.filteredBreeds[index].name!),
                          );
                        },
                        separatorBuilder: (context, index) => Container(
                              width: constraints.maxWidth,
                              height: 1,
                              color: constStyle.tertiaryColor,
                            ),
                        itemCount: store.filteredBreeds.length),
                  ))
                ],
              ),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation(constStyle.secundaryColor)));
          }
        },
      );
    });
  }
}
