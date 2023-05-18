import 'package:flutter/material.dart';
import 'package:recuperacaoprovafinancas/pages/acoesView.dart';
import 'package:recuperacaoprovafinancas/pages/bitcoinView.dart';
import 'package:recuperacaoprovafinancas/pages/moedasView.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/moeda',
      routes: {
        '/moeda': (context) => const MoedasView(),
        '/acoes': (context) => const AcoesView(),
        '/bitcoin': (context) => const BitcoinView(),
      },
    );
  }
}
