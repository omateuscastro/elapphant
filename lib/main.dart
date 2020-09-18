import 'package:elapphant/app/pages/home.dart';
import 'package:elapphant/app/pages/intro.dart';
import 'package:elapphant/app/stores/elephant_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<ElephantStore>(ElephantStore());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Elapphant',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IntroPage(),
      routes: {
        "/home": (_) => new HomePage(),
      },
    );
  }
}
