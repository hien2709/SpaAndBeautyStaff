import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/Staff/chat/components/staff.dart';
import 'package:spa_and_beauty_staff/main.dart';

import 'components/body.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  @override
  void initState() {
    // TODO: implement initState
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}
