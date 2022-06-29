// dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'onboarding_screen/onboarding.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Task 1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme:  AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.cyanAccent.shade700,
              statusBarIconBrightness: Brightness.light,
            )
          ),
      ),
      home: (OnBoarding()),
    );
  }
}
