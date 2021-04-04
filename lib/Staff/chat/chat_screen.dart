import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/Staff/chat/components/body.dart';
import 'package:spa_and_beauty_staff/constants.dart';

class ChatScreen extends StatefulWidget {
  static String routeName = "/chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        // appBar: AppBar(
        //     backgroundColor: kPrimaryColor,
        //     automaticallyImplyLeading: false,
        //     title: Row(
        //       children: [
        //         Icon(
        //           Icons.chat,
        //           color: Colors.white,
        //         ),
        //         SizedBox(width: 10),
        //         Text(
        //           "Chat",
        //           style: TextStyle(fontSize: 20, color: Colors.white),
        //         ),
        //       ],
        //     )),
        body: Body(),
      ),
    );
  }
}
