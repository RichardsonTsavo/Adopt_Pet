import 'dart:convert';

import 'package:adopt_pet/app/shared/models/miscellaneous/weight_and_height_model.dart';

class CatBreedModel {
  final WeightAndHeightModel? weight;
  final String? id;
  final String? name;
  final String? lifeSpan;
  final String? temperament;
  final String? origin;
  final String? description;
  final String? referenceImageId;
  final String? image;

  CatBreedModel(
      {this.weight,
      this.id,
      this.name,
      this.lifeSpan,
      this.temperament,
      this.origin,
      this.description,
      this.referenceImageId,
      this.image});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (weight != null) {
      map["weight"] = weight!.toMap();
    }
    if (id != null) {
      map["id"] = id;
    }
    if (name != null) {
      map["name"] = name;
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
    if (description != null) {
      map["description"] = description;
    }
    if (referenceImageId != null) {
      map["reference_image_id"] = referenceImageId;
    }
    if (image != null) {
      map["image"] = image;
    }
    return map;
  }

  factory CatBreedModel.fromMap(Map<String, dynamic> map) {
    return CatBreedModel(
      weight: WeightAndHeightModel.fromMap(map['weight']),
      id: map['id'],
      name: map['name'],
      lifeSpan: map['life_span'],
      temperament: map['temperament'],
      origin: map['origin'],
      description: map['description'],
      referenceImageId: map['reference_image_id'],
      image: map['image'] == null || map['image']['url'] == null
          ? "https://img.freepik.com/free-vector/404-error-web-template-with-mad-cat_23-2147763345.jpg?w=2000"
          : map['image']['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CatBreedModel.fromJson(String source) =>
      CatBreedModel.fromMap(json.decode(source));
}
