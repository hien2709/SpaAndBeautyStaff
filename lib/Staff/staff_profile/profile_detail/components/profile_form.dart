// import 'package:flutter/material.dart';
// import 'package:spa_and_beauty_staff/Model/staff.dart';
// import 'package:spa_and_beauty_staff/Service/staff_service.dart';
// import 'package:spa_and_beauty_staff/default_button.dart';
// import 'package:spa_and_beauty_staff/main.dart';
//
// import '../profile_detail_screen.dart';
//
// class ProfileForm extends StatefulWidget {
//
//   bool edit;
//   bool enableDropDown;
//
//
//
//   ProfileForm(this.edit, this.enableDropDown);
//
//   @override
//   _ProfileFormState createState() => _ProfileFormState();
// }
//
// class _ProfileFormState extends State<ProfileForm> {
//   Staff staff;
//   String genderChoose;
//   DateTime selectedDate ;
//
//
//   TextEditingController fullnameTextController = TextEditingController();
//   TextEditingController districtTextController = TextEditingController();
//   TextEditingController streetTextController = TextEditingController();
//   TextEditingController provinceTextController = TextEditingController();
//   TextEditingController dateOfBirthTextController = TextEditingController();
//   TextEditingController genderTextController = TextEditingController();
//
//   void getData() {
//     fullnameTextController = TextEditingController(text: staff.fullname);
//     districtTextController = TextEditingController(text: staff.district);
//     streetTextController = TextEditingController(text: staff.street);
//     provinceTextController = TextEditingController(text: staff.province);
//     genderTextController = TextEditingController(text: staff.gender.name);
//     dateOfBirthTextController = TextEditingController(
//         text: staff.dateOfBirth.toIso8601String().substring(0, 10));
//
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     StaffService.getStaffProfileById().then((value) =>
//     {
//       setState(() {
//         staff = value;
//         selectedDate = DateTime.parse(value.dateOfBirth.toIso8601String().substring(0,10));
//         genderChoose = value.gender.name;
//       }),
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     getData();
//     return Container(
//       child: Form(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             FullNameTextField(),
//             SizedBox(height: 30),
//             TextFormField(
//               onTap: (){
//                 showDatePicker(
//                   context: context,
//                   helpText: 'Select date of birth',
//                   cancelText: 'Cancel',
//                   confirmText: 'OK',
//                   initialDate: selectedDate,
//                   firstDate: DateTime(1900),
//                   lastDate: DateTime(2025),
//                 ).then((datePicked){
//                   setState(() {
//                     if(datePicked != null){
//                       selectedDate = datePicked;
//                     }
//                   });
//                 });
//               },
//               key: Key(selectedDate.toIso8601String().substring(0,10)),
//               initialValue: selectedDate.toIso8601String().substring(0,10),
//               //controller: dateOfBirthTextController,
//               enabled: widget.edit,
//               decoration: InputDecoration(
//                 labelText: "Năm sinh",
//                 floatingLabelBehavior: FloatingLabelBehavior.always,
//                 suffixIcon: Icon(Icons.baby_changing_station),
//               ),
//             ),
//             SizedBox(height: 30),
//             DistrictTextField(),
//             SizedBox(height: 30),
//             GenderField(),
//             SizedBox(height: 30),
//             ProvinceTextField(),
//             SizedBox(height: 30),
//             StreetTextField(),
//             SizedBox(height: 30),
//             buildUpdateButton(context),
//           ],
//         ),
//       ),
//     );
//   }
//
//   DefaultButton buildUpdateButton(BuildContext context) {
//     return DefaultButton (
//       text: "Cập nhật",
//       press: ()  {
//         String dateOfBirth = selectedDate.toIso8601String();
//         String district = districtTextController.text;
//         String fullname = fullnameTextController.text;
//         String gender = genderChoose;
//         String province = provinceTextController.text;
//         String street = streetTextController.text;
//         String image = MyApp.storage.getItem("image");
//         String lastLocation = "";
//         setState(() async {
//           widget.edit = false;
//           await StaffService().updateStaffProfile(
//               dateOfBirth,
//               district,
//               fullname,
//               image,
//               lastLocation,
//               gender,
//               province,
//               street);
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => ProfileDetailScreen()),
//           );
//         });
//       },
//     );
//   }
//
//   TextFormField DateOfBirthTextField() {
//     return TextFormField(
//       onTap: (){
//         showDatePicker(
//           context: context,
//           helpText: 'Select date of birth',
//           // Can be used as title
//           cancelText: 'Cancel',
//           confirmText: 'OK',
//           initialDate: selectedDate,
//           firstDate: DateTime(2000),
//           lastDate: DateTime(2025),
//         );
//       },
//       controller: dateOfBirthTextController,
//       enabled: widget.edit,
//       decoration: InputDecoration(
//         labelText: "Năm sinh",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Icon(Icons.baby_changing_station),
//       ),
//     );
//   }
//
//   TextFormField FullNameTextField() {
//     return TextFormField(
//       controller: fullnameTextController,
//       enabled: widget.edit,
//       decoration: InputDecoration(
//         labelText: "Họ tên",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Icon(Icons.drive_file_rename_outline),
//       ),
//     );
//   }
//
//   TextFormField DistrictTextField() {
//     return TextFormField(
//       controller: districtTextController,
//       enabled: widget.edit,
//       decoration: InputDecoration(
//         labelText: "Quận",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Icon(Icons.edit_road),
//       ),
//     );
//   }
//
//   Widget GenderField() {
//     if (widget.enableDropDown) {
//       return Padding(
//         padding: const EdgeInsets.only(left: 0),
//         child: Container(
//           padding: EdgeInsets.only(left: 40, right: 10),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: DropdownButton<String>(
//             value: genderChoose,
//             icon: const Icon(Icons.arrow_downward),
//             iconSize: 20,
//             elevation: 2,
//             isExpanded: true,
//             underline: SizedBox(),
//             onChanged: (String newValue) {
//               setState(() {
//                 genderChoose = newValue;
//                 print("GENDER: $genderChoose");
//               });
//             },
//             items: <String>['Male', 'Female']
//                 .map<DropdownMenuItem<String>>((String value) {
//               return DropdownMenuItem<String>(
//                 value: value,
//                 child: Text(value),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//     } else {
//       return TextFormField(
//         controller: genderTextController,
//         enabled: false,
//         decoration: InputDecoration(
//           labelText: "Gender",
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//           suffixIcon: Icon(Icons.support_agent),
//         ),
//       );
//     }
//   }
//
//   TextFormField ProvinceTextField() {
//     return TextFormField(
//       controller: provinceTextController,
//       enabled: widget.edit,
//       decoration: InputDecoration(
//         labelText: "Tỉnh thành",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Icon(Icons.home),
//       ),
//     );
//   }
//
//   TextFormField StreetTextField() {
//     return TextFormField(
//       controller: streetTextController,
//       enabled: widget.edit,
//       decoration: InputDecoration(
//         labelText: "Đường",
//         floatingLabelBehavior: FloatingLabelBehavior.always,
//         suffixIcon: Icon(Icons.add_location_alt_rounded),
//       ),
//     );
//   }
// }
