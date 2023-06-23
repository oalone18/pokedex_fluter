import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pokedex_fluter/model/pokemon_model.dart';

import '../pokemon_detail/pokemon_detail.dart';
import '../styles/styles.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final searchPokemonController = TextEditingController();
  List _allPokemons = [];
  List _pokemonList = [];
  Future? resultsLoaded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchPokemonController.addListener(onSearchChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    searchPokemonController.removeListener(onSearchChanged);
    searchPokemonController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    resultsLoaded = getPokemons();
  }

  onSearchChanged(){
    searchResultsList();
  }

  searchResultsList(){

    var showResults = [];

    if(searchPokemonController.text != ""){
      //we have search parameter
      for( var poke in _allPokemons){
        var name = PokemonModel(poke.name, poke.image, poke.number, poke.id).name.toLowerCase();
        if (name.contains(searchPokemonController.text.toLowerCase())){
          showResults.add(poke);
        }
      }
    }
    else{
      showResults = List.from(_allPokemons);
    }

    setState(() {
      _pokemonList = showResults;
    });
  }


  getPokemons() async{

    _allPokemons.add(PokemonModel("bulbasaur", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png", "#001", 1));
    _allPokemons.add(PokemonModel("ivysaur", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/2.png", "#002",2));
    _allPokemons.add(PokemonModel("venusaur", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/3.png", "#003",3));
    _allPokemons.add(PokemonModel("charmander", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/4.png", "#004",4));
    _allPokemons.add(PokemonModel("charmeleon", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/5.png", "#005",5));
    _allPokemons.add(PokemonModel("charizard", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/6.png", "#006",6));
    _allPokemons.add(PokemonModel("squirtle", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/7.png", "#007",7));
    _allPokemons.add(PokemonModel("wartortle", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/8.png", "#008",8));
    _allPokemons.add(PokemonModel("blastoise", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/9.png", "#009",9));
    _allPokemons.add(PokemonModel("caterpie", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/10.png", "#010",10));
    _allPokemons.add(PokemonModel("metapod", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/11.png", "#011",11));
    _allPokemons.add(PokemonModel("butterfree", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/12.png", "#012",12));
    _allPokemons.add(PokemonModel("weedle", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/13.png", "#013",13));
    _allPokemons.add(PokemonModel("kakuna", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/14.png", "#014",14));
    _allPokemons.add(PokemonModel("beedrill", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/15.png", "#015",15));
    _allPokemons.add(PokemonModel("pidgey", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/16.png", "#016",16));
    _allPokemons.add(PokemonModel("pidgeotto", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/17.png", "#017",17));
    _allPokemons.add(PokemonModel("pidgeot", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/18.png", "#018",18));
    _allPokemons.add(PokemonModel("rattata", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/19.png", "#019",19));
    _allPokemons.add(PokemonModel("raticate", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/20.png", "#020",20));

    //var data = await FirebaseFirestore.instance.collection('Companies').doc("${widget.company_id}").collection("Branch Offices").doc(branch_id).collection("Products").get();

    setState(() {
      //_allPokemons = data.docs;
    });

    searchResultsList();
    return "complete";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8D1818),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/pokeball.png", fit: BoxFit.fill, height: 30,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Pokedex",style: textWhiteTitle,),
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
            children: [
              Container(
                color: Color(0xFF8D1818),
                child: Padding(
                  padding: const EdgeInsets.all(22.0),
                  child: TextField(
                    //style: textInput,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: searchPokemonController,
                    decoration: textFieldDecoration.copyWith(hintText: "Buscar Pokemon...", prefixIcon: Icon(Icons.search,)),
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
             MasonryGridView.count(
                  physics: const ScrollPhysics(),
                  itemCount: _pokemonList.length,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PokemonDetail(name: _pokemonList[index].name, number: _pokemonList[index].number, image: _pokemonList[index].image, id : _pokemonList[index].id)));
                        },
                        child: Card(
                          shape: cardShape,
                          shadowColor: Colors.blueGrey,
                          elevation: 11,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(_pokemonList[index].number, textAlign: TextAlign.end, style: textGraySubTitle)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.network(_pokemonList[index].image, fit: BoxFit.contain, height: 50,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(_pokemonList[index].name, style: textBlackTitle, maxLines: 1,),
                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}



