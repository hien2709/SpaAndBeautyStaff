import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spa_and_beauty_staff/Service/staff_service.dart';

import '../../../../main.dart';

class ProfilePic extends StatefulWidget {
  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  PickedFile imageFile;
  final ImagePicker picker = ImagePicker();
  String image;

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(
      source: source,
    );
    setState(() {
      imageFile = pickedFile;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    await MyApp.storage.ready;
    int staffId = await MyApp.storage.getItem("staffId");
    String staffToken = await MyApp.storage.getItem("token");
    StaffService.getStaffProfileById(staffId, staffToken).then((staff) => {
          setState(() {
            image = staff.image;
            MyApp.storage.setItem("image", image);
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          CircleAvatar(
            backgroundImage: imageFile == null
                ? NetworkImage(image)
                : FileImage(File(imageFile.path)),
          ),
          Positioned(
            bottom: 0,
            right: -10,
            child: SizedBox(
              height: 50,
              width: 50,
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white)),
                onPressed: () {
                  print("Update image profile");
                  showModalBottomSheet(
                    context: context,
                    builder: ((builder) => bottomSheet()),
                  );
                },
                color: Color(0xFFF5F6F9),
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: [
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FlatButton.icon(
                onPressed: () async {
                  await takePhoto(ImageSource.camera);
                  print("Ch???p xong r???i!!");
                },
                icon: Icon(Icons.camera),
                label: Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () async {
                  await takePhoto(ImageSource.gallery);
                  print("Ch???p xong r???i!!");
                },
                icon: Icon(Icons.image),
                label: Text("Gallery"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
