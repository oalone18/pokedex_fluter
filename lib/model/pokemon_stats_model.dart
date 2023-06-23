import 'package:flutter/material.dart';

class PokemonStatsModel {
  int base_stat = 0;
  int effort = 0;
  String name= "";


  PokemonStatsModel(
      this.base_stat, this.effort, this.name
      );

  PokemonStatsModel.fromJson(Map<String, dynamic> json){
    base_stat = json['base_stat'];
    effort = json['effort'];
    name = json['stat']['name'];

  }

}