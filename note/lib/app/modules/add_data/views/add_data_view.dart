import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_data_controller.dart';

class AddDataView extends GetView<AddDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ADD DATA'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              TextField(
                controller: controller.name,
                decoration: InputDecoration(hintText: 'Name'),
              ),
              TextField(
                controller: controller.desc,
                decoration: InputDecoration(hintText: 'Description'),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.addData();
                  },
                  child: Text('Tambah Data'))
            ],
          ),
        ));
  }
}
