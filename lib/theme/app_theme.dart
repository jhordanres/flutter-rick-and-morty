
import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.green;
  static  Color secondColor = Colors.grey[850]!;

  //Tema claro 
  static final ThemeData lightTheme = ThemeData.light().copyWith(

    //Color primario de la app
    primaryColor: primary,

    //Tema AppBar 
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
      centerTitle: true
    ),

    //Tema para los TextButton claro 
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary)
    ),
    
  );

  //Tema oscuro 
  static final ThemeData darkTheme = ThemeData.dark().copyWith(

    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
      centerTitle: false
    ),

    //Para cambiar el color de fondo 
    //scaffoldBackgroundColor: Colors.grey[850],

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: primary)
    ),
  );
}