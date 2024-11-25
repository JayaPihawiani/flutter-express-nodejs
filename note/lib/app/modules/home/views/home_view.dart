import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:note/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTE'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: controller.getData(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Obx(() => controller.datas.length == 0
                ? Center(child: Text('Tidak ada data Note!'))
                : ListView.builder(
                    itemCount: controller.datas.length,
                    itemBuilder: (context, index) {
                      Map data = controller.datas[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EDIT_DATA, arguments: data);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          elevation: 3,
                          child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              width: Get.width,
                              child: Wrap(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${data['name']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['desc'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        data['createdAt'],
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        controller.deleteData(data['id']);
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              )),
                        ),
                      );
                    },
                  ));

            // if (controller.datas.length == 0) {
            //   child:
            //   Text('Tidak ada data');
            // }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.toNamed(Routes.ADD_DATA);
        },
      ),
    );
  }
}
