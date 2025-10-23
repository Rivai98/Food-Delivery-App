import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoApp(
          debugShowCheckedModeBanner: false,
          theme: CupertinoThemeData(),
          
        )
        : MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: ThemeData(
            fontFamily: 'Space Grotesk',
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
            primaryColor: Colors.deepOrange,
            drawerTheme: DrawerThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.deepOrange,
            ),
            appBarTheme: AppBarTheme(backgroundColor: Colors.grey[200]),
            scaffoldBackgroundColor: Colors.grey[200],
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.deepOrange,
            ),
          ),
          home: BottomNavBarPage(),
        );
  }
}
