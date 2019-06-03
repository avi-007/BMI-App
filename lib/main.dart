import 'package:flutter/material.dart';
import './ui/home.dart';

void main(){
  runApp(new MaterialApp(
    title: "BMI",
    debugShowCheckedModeBanner: false,
    home: new Home(),
  ));
}