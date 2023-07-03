// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:transaction/widgets/home.dart';
// import 'package:flutter/services.dart';

var kColorSheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 28, 232, 184),
);

var kDarkColorSheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 5, 91),
);

void main() {

  // WidgetsFlutterBinding.ensureInitialized();

  //Lock Device orientation
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp
  // ]).then((value) => runApp(MyApp()));

  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal ',
      darkTheme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: kDarkColorSheme,
        //AppBar Theme
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorSheme.onPrimaryContainer,
          foregroundColor: kDarkColorSheme.onPrimary,
        ),
        //Card Theme
        cardTheme: CardTheme().copyWith(
          color: kDarkColorSheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSheme.primaryContainer,
            foregroundColor: kDarkColorSheme.onPrimaryContainer
          ),
        ),

        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              color: kDarkColorSheme.secondaryContainer,
              fontWeight: FontWeight.normal,
              fontSize: 18,
              fontFamily: 'OpenSans',
            ),
            
            ),
            
      
      ),

      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorSheme.onPrimaryContainer,
          foregroundColor: kColorSheme.onPrimary,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorSheme.secondaryContainer,
          shadowColor: kColorSheme.onPrimaryContainer,
          margin: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSheme.onPrimaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                fontFamily: 'OpenSans',
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
