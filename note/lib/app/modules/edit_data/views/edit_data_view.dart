import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_data_controller.dart';

class EditDataView extends GetView<EditDataController> {
  @override
  Widget build(BuildContext context) {
    controller.name.text = controller.data['name'];
    controller.desc.text = controller.data['desc'];
    return Scaffold(
        appBar: AppBar(
          title: Text('EditDataView'),
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
                    controller.editData();
                  },
                  child: Text('Edit Data'))
            ],
          ),
        ));
  }
}
