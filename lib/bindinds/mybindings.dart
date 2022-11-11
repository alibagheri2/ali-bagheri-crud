import 'package:get/get.dart';
import 'package:mycrud/controllers/camera_controller.dart';
import '../controllers/info_controller.dart';
import '../controllers/info_feild_controller.dart';
class mybindings extends Bindings{
  @override
  void dependencies() {
    Get.put(info_controller());
    Get.put(info_feild_controller());

  }

}