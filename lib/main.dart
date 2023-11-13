import 'package:flutter/material.dart';
import 'package:support/presentation/home/Home.dart';
import 'package:support/presentation/utils/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotels',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.deepBlue),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

