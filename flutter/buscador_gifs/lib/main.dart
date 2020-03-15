import 'package:buscador_gifs/ui/home-page.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      highlightColor: Colors.white,
    ),
  ));
}