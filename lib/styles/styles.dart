import 'package:flutter/material.dart';

const textWhiteTitle = TextStyle(
    fontSize: 22,
    //fontFamily: 'Cute Font',
    fontWeight: FontWeight.bold,
    letterSpacing: 3,
    color: Color(0xFFF3F3F3)

);

const backgroundStyle = BoxDecoration(
  gradient: LinearGradient(colors: [
    Color(0xFFFFFFFF),
    Color(0xFFC79B9B),
  ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),


);

const textFieldDecoration = InputDecoration(

    fillColor: Color(0xFFF3F3F3),
    filled: true,
    labelStyle: TextStyle(
      color: Color(0xFFF3F3F3),
      fontWeight: FontWeight.w500,
    ),
    //hintText: "______",
    hintStyle: TextStyle(
        color: Color(0xFFAEADE3)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x1D4C94), width: 0.0),
        borderRadius: BorderRadius.all(Radius.circular(22))
    ),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0x1D4C94),width: 0.0),
        borderRadius: BorderRadius.all(Radius.circular(22))
    )

);

const textGraySubTitle = TextStyle(
    fontSize: 11,
    //fontFamily: 'Cute Font',
    fontWeight: FontWeight.normal,
    letterSpacing: 1,
    color: Colors.blueGrey

);

const cardShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(22))

);

const textBlackTitle = TextStyle(
    fontSize: 12,
    //fontFamily: 'Cute Font',
    fontWeight: FontWeight.w500,
    letterSpacing: 3,
    color: Colors.black

);