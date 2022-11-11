import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/info_models.dart';
class info_controller extends GetxController{
  RxBool isEditing=false.obs;
  int index=0 ;
  RxList <infomodel> list=<infomodel> [].obs;

  @override
  void onInit() {
    var box=GetStorage();

    if(box.read('list') != null)
      {
        var getList =  box.read('list');
        for(var item in getList){
          list.add(infomodel.fromjson(item));
        }
      }
    ever(list, (value){
      final jsonList = list.map((element) => element.tojson()).toList();
      box.write('list', jsonList);
    });

    super.onInit();
  }
}