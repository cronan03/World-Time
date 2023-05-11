
import 'package:flutter/material.dart';
import 'package:world_timer/pages/home.dart';
import 'package:world_timer/pages/loading.dart';
import 'package:world_timer/pages/choose_location.dart';



void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (a) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => ChooseLocation(),
  }
));