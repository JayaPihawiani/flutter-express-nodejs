import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../home/controllers/home_controller.dart';

class EditDataController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController desc = TextEditingController();
  HomeController homeC = Get.find<HomeController>();
  Map data = Get.arguments;

  editData() async {
    if (name.text.isEmpty || desc.text.isEmpty) {
      Get.dialog(Container(
        child: Center(child: Text("FIeld ksong")),
      ));
    } else {
      try {
        var response = await http.patch(
            Uri.parse('http://localhost:5000/note/${data['id']}'),
            body: json.encode({'name': name.text, 'desc': desc.text}),
            headers: {'Content-Type': 'application/json'});

        if (response.statusCode == 200) {
          homeC.getData();
          Get.back();
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
