import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository.dart';
import 'package:adopt_pet/app/shared/service/shared_preference/shared_preferences_repository_interface.dart';
import 'package:flutter/material.dart';

class ConstStyle {
  int indexBaseColor = 1;

  void setIndexBaseColor(int index) {
    ISharedPreferencesRepositoryInterface pref = SharedPreferencesRepository();
    indexBaseColor = index;
    pref.save(key: "indexBaseColor", item: [index.toString()]);
  }

  //colors
  final List<List<Color>> colorsData = [
    [
      const Color.fromARGB(255, 255, 177, 42),
      const Color.fromARGB(255, 242, 121, 53)
    ],
    [
      const Color.fromARGB(255, 160, 225, 237),
      const Color.fromARGB(255, 49, 138, 180)
    ],
    [
      const Color.fromARGB(255, 159, 197, 32),
      const Color.fromARGB(255, 76, 173, 45)
    ],
    [
      const Color.fromARGB(255, 191, 132, 191),
      const Color.fromARGB(255, 131, 50, 132)
    ]
  ];

  get primaryColor => colorsData[indexBaseColor][0];
  get secundaryColor => colorsData[indexBaseColor][1];
  Color tertiaryColor = const Color.fromARGB(255, 255, 255, 255);

  // assets
  final String loaderAnimation = "assets/loading_animation.gif";
  final String logo = "assets/logo.png";
}
