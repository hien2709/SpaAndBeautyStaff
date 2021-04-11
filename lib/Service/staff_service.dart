import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:spa_and_beauty_staff/Model/Staff.dart';
import 'package:spa_and_beauty_staff/Staff/chat/components/staff.dart';

import '../main.dart';

class StaffService {
  static const String urlGetProfile =
      "https://capstonever3.herokuapp.com/staff/get_staff_info_by_staff_id/";
  static const String urlUpdateProfile = "chua co";

  static Future<Staff> getStaffProfileById(id, token) async {
    try {
      final response = await http.get(urlGetProfile + id.toString(), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
      print(response.body);
      if (response.statusCode == 200) {
        return Staff.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load staffProfile');
      }
    } catch (e) {
      throw Exception('Failed to load staffProfile');
    }
  }

  Future<http.Response> updateStaffProfile({
    fullname,
    image,
    id,
    token,
  }) {
    return http.put(
      urlUpdateProfile + id.toString(),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(<String, String>{
        "fullname": fullname,
        "image": image,
      }),
    );
  }
}
