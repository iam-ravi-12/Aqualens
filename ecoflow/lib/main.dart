import 'package:ecoflow/consts/language.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'screens/languagePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      translations: Language(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Languagepage(),
    );
  }
}
