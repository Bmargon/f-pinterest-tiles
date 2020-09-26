
import 'package:flutter/material.dart';
import 'package:pinterest/src/pages/emergency_page.dart';
import 'package:pinterest/src/pages/pinteres_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        body: EmergencyPage()
      ),
    );
  }
}