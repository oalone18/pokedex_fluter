import 'package:flutter/material.dart';

class PokemonModel {
  String name;
  String image;
  String number;
  int id;

  PokemonModel(
      this.name,
      this.image,
      this.number,
      this.id);

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'image': image,
        'number': number,
        'id' : id,
      };


}