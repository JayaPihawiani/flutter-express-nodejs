import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<Map<String, dynamic>> datas = <Map<String, dynamic>>[].obs;

  Future<List<Map<String, dynamic>>> getData() async {
    var response = await http.get(Uri.parse('http://localhost:5000/note'));
    List<Map<String, dynamic>> dataResponse = [];
    List body = json.decode(response.body);
    body.forEach((e) => {dataResponse.add(e)});
    datas.value = dataResponse;
    print('DIJALANKAN');
    return datas;

    // return dataDecode;
  }

  void deleteData(id) async {
    try {
      var response =
          await http.delete(Uri.parse('http://localhost:5000/note/${id}'));
      if (response.statusCode == 200) {
        getData();
      }
    } catch (e) {
      print(e);
    }
  }
}
