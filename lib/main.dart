import 'package:clima_app/screens/city_screen.dart';


import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  
  
  @override
  
  Widget build(BuildContext context) {
    return const MaterialApp(
      
      home:  MainPage(),
    );
  
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const WeatherMainPage(),
    );
  }
}

