
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:spa_and_beauty_staff/Model/Staff.dart';
import 'package:spa_and_beauty_staff/Model/StaffSchedule.dart';
import '../main.dart';


class StaffScheduleService{
  static final String urlStaffSchedule =
      "https://capstonever3.herokuapp.com/staff/get_schedule_of_one_staff/";


  static Future<List<StaffSchedule>> getStaffSchedule(String id) async {
    try {
      print("dit me m thu null xem : $id");
      final response = await http.get(urlStaffSchedule + id);
      print(response.body);
      print("status code la : "+response.statusCode.toString());
      if (response.statusCode == 200) {
        final  List<StaffSchedule> list = staffScheduleFromJson(utf8.decode(response.bodyBytes));
        return list;
      } else {
        throw Exception('Failed to load staffProfile');
      }
    } catch (e) {
      throw Exception('Failed to load staffProfile');
    }
  }
}