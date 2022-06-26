import 'dart:convert';

import 'package:adopt_pet/app/shared/models/miscellaneous/weight_and_height_model.dart';

class DogBreedModel {
  final WeightAndHeightModel? weight;
  final WeightAndHeightModel? height;
  final int? id;
  final String? name;
  final String? bredFor;
  final String? breedGroup;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? referenceImageId;
  final String? image;

  DogBreedModel(
      {this.weight,
      this.height,
      this.id,
      this.name,
      this.bredFor,
      this.breedGroup,
      this.lifeSpan,
      this.temperament,
      this.origin,
      this.referenceImageId,
      this.image});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (weight != null) {
      map["weight"] = weight!.toMap();
    }
    if (height != null) {
      map["height"] = height!.toMap();
    }
    if (id != null) {
      map["id"] = id;
    }
    if (name != null) {
      map["name"] = name;
    }
    if (bredFor != null) {
      map["bred_for"] = bredFor;
    }
    if (breedGroup != null) {
      map["breed_group"] = breedGroup;
    }
    if (lifeSpan != null) {
      map["life_span"] = lifeSpan;
    }
    if (temperament != null) {
      map["temperament"] = temperament;
    }
    if (origin != null) {
      map["origin"] = origin;
    }
    if (referenceImageId != null) {
      map["reference_image_id"] = referenceImageId;
    }
    if (image != null) {
      map["image"] = image;
    }
    return map;
  }

  factory DogBreedModel.fromMap(Map<String, dynamic> map) {
    return DogBreedModel(
      weight: WeightAndHeightModel.fromMap(map['weight']),
      height: WeightAndHeightModel.fromMap(map['height']),
      id: map['id'],
      name: map['name'],
      bredFor: map['bred_for'],
      breedGroup: map['breed_group'],
      lifeSpan: map['life_span'],
      temperament: map['temperament'],
      origin: map['origin'],
      referenceImageId: map['reference_image_id'],
      image: map['image']['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DogBreedModel.fromJson(String source) =>
      DogBreedModel.fromMap(json.decode(source));
}
