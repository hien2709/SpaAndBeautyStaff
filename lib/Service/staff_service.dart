// import 'dart:convert';
// import 'dart:io';
//
// import 'package:http/http.dart' as http;
// import 'package:spa_and_beauty_staff/Model/staff.dart';
//
// import '../main.dart';
//
// class StaffService {
//   static const String urlGetProfile =
//       "https://capstonever3.herokuapp.com/customer/get_customer_profile_by_id/";
//   static const String urlUpdateProfile =
//       "https://capstonever3.herokuapp.com/customer/update_customer_info/";
//   static int id = MyApp.storage.getItem("customerId");
//   static String token = MyApp.storage.getItem("token");
//
//   static Future<Staff> getStaffProfileById() async {
//     try {
//       final response = await http.get(urlGetProfile + id.toString(), headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       });
//       print(response.body);
//       if (response.statusCode == 200) {
//         return Staff.fromJson(json.decode(response.body));
//       } else {
//         throw Exception('Failed to load customer');
//       }
//     } catch (e) {
//       throw Exception('Failed to load customer');
//     }
//   }
//
//   Future<http.Response> updateStaffProfile(dateOfBirth, district, fullname, image, lastLocation, gender, province, street) {
//     String token = MyApp.storage.getItem("token");
//     return http.put(urlUpdateProfile + id.toString(),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization': 'Bearer $token',
//       },
//       body: jsonEncode(<String, String>{
//         "dateOfBirth": dateOfBirth,
//         "district": district,
//         "fullname": fullname,
//         "image": image,
//         "last_location": lastLocation,
//         "gender": gender,
//         "province": province,
//         "street": street
//       }),
//     );
//   }
// }
