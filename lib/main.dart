import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mycrud/pages/cusromerslist.dart';
import 'package:mycrud/routs/routs.dart';
import 'bindinds/mybindings.dart';
void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'my crub',
        defaultTransition: Transition.fadeIn,
        getPages:Routes.pages,
        initialRoute:'/CustomersList',
        initialBinding:mybindings(),
        home:CustomersList(),
    );
  }
}
