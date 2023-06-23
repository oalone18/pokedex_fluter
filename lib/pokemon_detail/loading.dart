import 'package:flutter/material.dart';

import '../styles/styles.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF8D1818),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset("assets/pokeball.png", fit: BoxFit.fill, height: 60,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cargando...", style: textGraySubTitle.copyWith(color: Colors.white),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
