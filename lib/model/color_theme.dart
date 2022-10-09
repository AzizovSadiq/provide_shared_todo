

import 'package:flutter/material.dart';

class ColorTheme extends ChangeNotifier{



  ThemeData greenTheme = ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.green, 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.green),
        appBarTheme: const AppBarTheme(color: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color:Colors.white)),

      );
  ThemeData redTheme = ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.red, 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.red),
        appBarTheme: const AppBarTheme(color: Colors.red),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color:Colors.white)),

      );

  ThemeData _selectedTheme = ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.green, 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.green),
        appBarTheme: const AppBarTheme(color: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color:Colors.white)),

      );
  
  void changeTheme(bool select){
    _selectedTheme = select ? greenTheme : redTheme ;
   notifyListeners();
  }

  ThemeData get selectedThemeData => _selectedTheme;

}

 
