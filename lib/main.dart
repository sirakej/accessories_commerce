import 'package:accessoriescommerce/UI/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:accessoriescommerce/UI/ui_content/content.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: StartScreen(),
      home:Content(),
      debugShowCheckedModeBanner: true,
    );
  }
}