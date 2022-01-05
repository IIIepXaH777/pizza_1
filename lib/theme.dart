import 'package:flutter/material.dart';

ThemeData globalTheme() => ThemeData(
      fontFamily: 'Roboto',
      splashColor: Colors.yellow,
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.light,
        primarySwatch: Colors.red,
      ).copyWith(secondary: Colors.amber),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.black),
        headline5: TextStyle(
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway',
            color: Colors.red),
        bodyText1: TextStyle(
            fontSize: 18.0,
            fontFamily: 'Amina',
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple),
        bodyText2: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.lime),
      ),
    );
