import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class info_feild_controller extends GetxController{
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController birthday;
  late TextEditingController phonenumber;
  late TextEditingController email;
  late TextEditingController banckacountnumber;
  @override
  void onInit() {
    firstname=TextEditingController();
    lastname=TextEditingController();
    birthday=TextEditingController();
    phonenumber=TextEditingController();
    email=TextEditingController();
    banckacountnumber=TextEditingController();
    super.onInit();
  }
}