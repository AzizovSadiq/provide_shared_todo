

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier{
  ThemeData _currentTheme = greenTheme;
  bool _currentCheck = false;
  // IconData iconTheme = Icons.sunny;   //secime bagli iconda qoymaq olar
  Color colorTheme = Colors.green;
  
  ThemeData get currentTheme => _currentTheme;
  bool get currentCheck => _currentCheck;

  ThemeSettings(bool isTheme){
    if(isTheme){
     _currentTheme = redTheme;
      // iconTheme = Icons.dark_mode;     //secime bagli iconda qoymaq olar
      colorTheme = Colors.green;
    }else{
      _currentTheme = greenTheme;
      // iconTheme = Icons.sunny;         //secime bagli iconda qoymaq olar
      colorTheme = Colors.red;
    }
    
  }

  void toggleTheme() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    if(_currentTheme == greenTheme){
      _currentTheme = redTheme;
      _currentCheck = true;
      // iconTheme = Icons.dark_mode;        //secime bagli iconda qoymaq olar
      colorTheme = Colors.green;
      _pref.setBool('theme', true);
    }else{
      _currentTheme = greenTheme;
      _currentCheck = false;
      //  iconTheme = Icons.sunny;          //secime bagli iconda qoymaq olar
       colorTheme = Colors.red;
      _pref.setBool('theme', false);
    }
    notifyListeners();
  }
}
  ThemeData greenTheme = ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.green, 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(secondary: Colors.green),
        appBarTheme: const AppBarTheme(color: Colors.green),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color:Colors.white),
          headline5: TextStyle(color:Colors.white),),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.yellow)),
          

      );
  ThemeData redTheme = ThemeData(
        primaryColor: Colors.red,
        scaffoldBackgroundColor: Colors.red, 
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red).copyWith(secondary: Colors.red),
        appBarTheme: const AppBarTheme(color: Colors.red),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
          headline3: TextStyle(color:Colors.white),
          headline5: TextStyle(color:Colors.white)),
           elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(primary: Colors.yellow)),
            

      );