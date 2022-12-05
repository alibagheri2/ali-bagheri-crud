import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mycrud/controllers/camera_controller.dart';
import 'package:mycrud/controllers/info_controller.dart';

import '../controllers/info_feild_controller.dart';

class CustomersList extends StatelessWidget {
  const CustomersList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey.shade700,
              title: const Text('Customers List'),
              centerTitle: true,
      ),
            body: Stack(
              children: [
                 background(),
                 Column(
                   children: [
                      listveiw(),
            ],
          )
        ],
      ),
            floatingActionButton: floating_action_button(),
    ));
  }
}

class background extends StatelessWidget {
  const background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}

class listveiw extends StatelessWidget {
  const listveiw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Obx(() {
      return ListView.separated(
        separatorBuilder: (BuildContext, index) {
          return Divider(
            color: Colors.black,
          );
        },
        itemCount: Get.find<info_controller>().list.length,
        itemBuilder: (BuildContext, index) {
          return Stack(
            alignment: Alignment.centerRight,
            children: [
              ListTile(
                key: const Key('list item'),
                onLongPress: () {
                  Get.find<info_feild_controller>().firstname.text =
                      Get.find<info_controller>().list[index].firstname ?? '';
                  Get.find<info_feild_controller>().lastname.text =
                      Get.find<info_controller>().list[index].lastname ?? '';
                  Get.find<info_feild_controller>().birthday.text =
                      Get.find<info_controller>().list[index].birthday ?? '';
                  Get.find<info_feild_controller>().phonenumber.text =
                      Get.find<info_controller>().list[index].phonenumber ?? '';
                  Get.find<info_feild_controller>().email.text =
                      Get.find<info_controller>().list[index].email;
                  Get.find<info_feild_controller>().banckacountnumber.text =
                      Get.find<info_controller>()
                              .list[index]
                              .banckacountnumber ??
                          '';
                  Get.toNamed('/Add_New_Customers');
                  Get.find<info_controller>().isEditing.value = true;
                  Get.find<info_controller>().index = index;
                },
                title: Text(
                    Get.find<info_controller>().list[index].firstname ?? ''),
                subtitle: Text(
                    Get.find<info_controller>().list[index].lastname ?? ''),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: GestureDetector(
                  key:const Key('delete'),
                    onTap: () {
                      Get.find<info_controller>().list.removeAt(index);
                    },
                    child: Icon(
                      Icons.delete,
                      color: Colors.grey.shade600,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 40),
                  child: GestureDetector(
                    key: const Key('eye'),
                      onTap: () {
                        Get.find<info_controller>().index = index;
                        Get.defaultDialog(
                            textCancel: 'Ok',
                            title: 'Informations',
                            middleText:
                                'Name : ${Get.find<info_controller>().list[Get.find<info_controller>().index].firstname}\nLastName : ${Get.find<info_controller>().list[Get.find<info_controller>().index].lastname}\nBorn : ${Get.find<info_controller>().list[Get.find<info_controller>().index].birthday}\nPhone Number : ${Get.find<info_controller>().list[Get.find<info_controller>().index].phonenumber}\nEmail : ${Get.find<info_controller>().list[Get.find<info_controller>().index].email}\nB.A.N : ${Get.find<info_controller>().list[Get.find<info_controller>().index].banckacountnumber}');
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey.shade600,
                      )))
            ],
          );
        },
      );
    }));
  }
}

class floating_action_button extends StatelessWidget {
  const floating_action_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.grey.shade700,
      onPressed: () {
        Get.toNamed('/Add_New_Customers');
        Get.find<info_controller>().isEditing.value = false;
        Get.find<info_feild_controller>().firstname.text = '';
        Get.find<info_feild_controller>().lastname.text = '';
        Get.find<info_feild_controller>().birthday.text = '';
        Get.find<info_feild_controller>().phonenumber.text = '';
        Get.find<info_feild_controller>().email.text = '';
        Get.find<info_feild_controller>().banckacountnumber.text = '';
      },
      child: Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }
}
