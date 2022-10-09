import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app_with_provider/model/item_data.dart';
import 'package:todo_app_with_provider/pages/home_screen.dart';
import 'model/color_theme.dart';
import 'model/item_model.dart';
import 'provider/theme_setting.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences _pref = await SharedPreferences.getInstance();
  final isTheme = _pref.getBool('theme') ?? false;

  await ItemData().creatSharedObject();

  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider<ItemData>(
          create: (BuildContext context) => ItemData()),
      
      ChangeNotifierProvider<ThemeSettings>(
              create: (BuildContext context)=> ThemeSettings(isTheme)),
      
    ],
    child:  MyApp(isTheme: isTheme),
  ));
}

class MyApp extends StatelessWidget {

  bool isTheme;
   MyApp({Key? key,required this.isTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<ThemeSettings>(context);
    Provider.of<ItemData>(context).loadItemSharedsPref();
    return MaterialApp(
      theme: settings.currentTheme,
      home: SplashWidget(),
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network('https://picsum.photos/200/300',fit: BoxFit.cover,),
      title: const Text(
        "Todo",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colors.grey.shade400,
      showLoader: true,
      loadingText: const Text("Loading..."),
      navigator: HomeScreen(),
      durationInSeconds: 2,
    );
  }
}