import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../home/controllers/home_controller.dart';

class AddDataController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  HomeController homeC = Get.find<HomeController>();

  void addData() async {
    try {
      var response = await http.post(Uri.parse('http://localhost:5000/note'),
          body: json.encode({'name': name.text, "desc": desc.text}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode == 201) {
        homeC.getData();
        Get.back();
      }
    } catch (e) {
      print(e);
    }
  }
}
