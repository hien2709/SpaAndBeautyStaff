import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/Staff/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home_screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home screen"),
        automaticallyImplyLeading: false,
      ),
      body: Body(),
    );
  }
}
