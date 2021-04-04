import 'package:flutter/material.dart';
import 'package:spa_and_beauty_staff/Service/firebase.dart';
import 'package:spa_and_beauty_staff/main.dart';
import 'chat_card.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseMethod firebaseMethod = FirebaseMethod();
  Stream chatRoomStream;
  int staffId;

  getChatRoom() async {
    await firebaseMethod
        .getChatRoomStream(MyApp.storage.getItem("staffId"))
        .then((value) {
      setState(() {
        chatRoomStream = value;
        staffId = MyApp.storage.getItem("staffId");
        print("Staff Id: $staffId");
      });
    });
  }

  Widget ShowChatRoomList() {
    return StreamBuilder(
      stream: chatRoomStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) => ChatCard(
                    customerId: snapshot
                        .data.documents[index].data["chatRoomId"]
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll("$staffId", ""),
                    chatRoomId:
                        snapshot.data.documents[index].data["chatRoomId"]),
              )
            : Container();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getChatRoom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Chats",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade400,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),
            ShowChatRoomList(),
          ],
        ),
      ),
    );
  }
}
