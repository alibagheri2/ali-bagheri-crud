import 'package:get/get.dart';
import '../pages/add_new_customers.dart';
import '../pages/cusromerslist.dart';
class Routes{
  static List<GetPage>get pages=>[
    GetPage(name: '/CustomersList', page:()=> const CustomersList()),
    GetPage(name: '/Add_New_Customers', page: ()=> Add_New_Customers())
  ];
}