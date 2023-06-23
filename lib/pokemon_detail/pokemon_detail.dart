import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pokedex_fluter/model/pokemon_stats_model.dart';
import 'package:pokedex_fluter/pokemon_detail/loading.dart';
import '../styles/styles.dart';

class PokemonDetail extends StatefulWidget {
  final  String name, number,image;
  int id;
  PokemonDetail({required  this.name, required this.number, required this.image, required this.id});

  @override
  State<PokemonDetail> createState() => _PokemonDetailState();
}

class _PokemonDetailState extends State<PokemonDetail> {

  final dio = Dio();
  int pokemon_weight = 0, pokemon_height = 0, pokemon_base_experience = 0;

  List<PokemonStatsModel> _stats = <PokemonStatsModel>[];
  var stat;
  List<dynamic> statJson = [];

  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPokemonData("${widget.id}");
    fetchStats("${widget.id}").then((value) {
      setState(() {
        _stats.addAll(value);

      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true ? Loading() : Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D1818),
        //automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${widget.name}", style: textWhiteTitle,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text("${widget.number}", style: textWhiteTitle.copyWith(fontSize: 11),)),
            )
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backgroundStyle,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Image.network("${widget.image}", fit: BoxFit.fill, height: 200,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 12, 2, 0),
                child: Card(
                  shape: cardShape,
                  shadowColor: Colors.blueGrey,
                  elevation: 11,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text("About", style: textBlackTitle.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800),),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.monitor_weight_outlined),
                                          Text(pokemon_weight.toString(), style: textBlackTitle.copyWith(fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Weight", style: textGraySubTitle,),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.height),
                                          Text(pokemon_height.toString(), style: textBlackTitle.copyWith(fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Height", style: textGraySubTitle,),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Icon(Icons.data_exploration_rounded),
                                          Text(pokemon_base_experience.toString(), style: textBlackTitle.copyWith(fontSize: 16),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Base Experience", style: textGraySubTitle,),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: Text("Base Stats", style: textBlackTitle.copyWith(color: Colors.black54, fontSize: 15, fontWeight: FontWeight.w800),),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: _stats.length,
                              itemBuilder:  (context, index){

                                return Card(
                                    elevation: 11,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                              child: Text(_stats[index].name, style: textBlackTitle,),
                                          alignment: Alignment.centerLeft,),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: LinearPercentIndicator(
                                                width: 140.0,
                                                lineHeight: 14.0,
                                                percent: double.parse((_stats[index].base_stat/1000).toString()),
                                                backgroundColor: Colors.grey,
                                                progressColor: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(_stats[index].base_stat.toString(), style: textBlackTitle,)),
                                        ],
                                      ),
                                    ));

                          }),

                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }



  Future getPokemonData(id) async{

    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/'+id.toString()+"/");

    var response = await http.get(url);

    Map<dynamic, dynamic> responseJson = json.decode(response.body);

    setState(() {
      pokemon_weight = responseJson['weight'];
      pokemon_height = responseJson['height'];
      pokemon_base_experience = responseJson['base_experience'];
      isLoading = false;
    });



  }

  Future<List<PokemonStatsModel>> fetchStats(id) async {

    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/'+id.toString()+"/");

    var response = await http.get(url);

    List<dynamic> responseJson = json.decode(response.body)['stats'];

    stat = <PokemonStatsModel>[];
    statJson = responseJson;

    if(statJson != null){
      for (var depJson  in statJson){
        stat.add(PokemonStatsModel.fromJson(depJson));
        //_stats.clear();
      }
    }

    return stat;
  }
}
