import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:initial_bilan_app/providers/bilan_provider.dart';
import 'package:initial_bilan_app/screens/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BilanProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bilan Santé',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const WelcomeScreen(),
    );
  }
}
