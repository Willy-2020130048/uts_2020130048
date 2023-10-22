import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_2020130048/providers/produk_provider.dart';
import 'package:uts_2020130048/screens/home_screen.dart';
import 'package:uts_2020130048/screens/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProdukProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}
