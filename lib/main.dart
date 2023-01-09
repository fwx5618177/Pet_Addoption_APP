import 'package:flutter/material.dart';
import 'package:pet_adoption/utils/theme.dart';
import 'package:pet_adoption/views/app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Adoption',
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      home: App(),
    );
  }
}
