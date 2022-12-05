// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:get/get_navigation/src/routes/transitions_type.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:mycrud/bindinds/mybindings.dart';
// import 'package:mycrud/controllers/info_controller.dart';
// import 'package:mycrud/main.dart';
// import 'package:mycrud/models/info_models.dart';
// import 'package:mycrud/pages/add_new_customers.dart';
// import 'package:mycrud/pages/cusromerslist.dart';
// import 'package:mycrud/routs/routs.dart';
//
// class MockCustomersList extends GetxController with Mock implements info_controller{}
// void main(){
//  late MockCustomersList mockCustomersList;
//   setUp((){
//     mockCustomersList=MockCustomersList();
//     Get.put<info_controller>(mockCustomersList);
//   });
//    RxList<infomodel> listOfCustomers=<infomodel>[
//     infomodel(birthday: '2022-01-01',
//               lastname: 'lastname',
//               banckacountnumber: '123456',
//               email: 'a@yahoo.com',
//               firstname: 'firstname',
//               phonenumber: '09131112233')
//   ].obs;
//
//   Widget wut (){
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'my crub',
//       defaultTransition: Transition.fadeIn,
//       getPages:Routes.pages,
//       initialRoute:'/CustomersList',
//       initialBinding:mybindings(),
//       home:CustomersList(),
//     );
//   }
//
//   testWidgets('customers list widgets',
//           (WidgetTester tester) async{
//               Obx((){return mockCustomersList.list=listOfCustomers;});
//
//               await tester.pumpWidget(wut());
//               await tester.pump();
//               await tester.pumpAndSettle();
//
//               expect(find.byType(CustomersList), findsOneWidget);
//               expect(find.byType(Add_New_Customers),findsNothing);
//               expect(find.text('Customers List'), findsOneWidget);
//               expect(find.byType(FloatingActionButton),findsOneWidget);
//               expect(find.byKey(const Key('delete')), findsOneWidget);
//               expect(find.byKey(const Key('eye')), findsOneWidget);
//               expect(find.text('firstname'), findsOneWidget);
//               expect(find.text('lastname'), findsOneWidget);
//             }
//           );
//   testWidgets('add new customers widget',
//           (WidgetTester tester) async{
//             Get.put(MockCustomersList());
//             when(()=>Get.find<MockCustomersList>().onInit()).thenAnswer((_)=>listOfCustomers);
//
//             await tester.pumpWidget(wut());
//             await tester.pump();
//             await tester.pumpAndSettle();
//
//             await tester.tap(find.byType(FloatingActionButton));
//             await tester.pumpAndSettle();
//
//             expect(find.byType(CustomersList), findsNothing);
//             expect(find.byType(Add_New_Customers),findsOneWidget);
//             expect(find.text('Add Your Information'), findsOneWidget);
//             expect(find.byKey(const Key('first name')), findsOneWidget);
//             expect(find.byKey(const Key('phone number')), findsOneWidget);
//             expect(find.byKey(const Key('email')), findsOneWidget);
//             expect(find.byKey(const Key('last name')), findsOneWidget);
//             expect(find.byKey(const Key('birthday')), findsOneWidget);
//             expect(find.byKey(const Key('b.a.n')), findsOneWidget);
//             expect(find.byKey(const Key('add_button')), findsOneWidget);
//             expect(find.byKey(const Key('back')), findsOneWidget);
//           });
//   // testWidgets('list of customers is available at customersList page',
//   //         (WidgetTester tester) async{
//   //           myinfomodel();
//   //           await tester.pumpWidget(wut());
//   //           await tester.pump();
//   //           await tester.pumpAndSettle();
//   //
//   //           expect(find.byKey(const Key('delete')), findsOneWidget);
//   //           expect(find.byKey(const Key('eye')), findsOneWidget);
//   //           expect(find.text('firstname'), findsOneWidget);
//   //           expect(find.text('lastname'), findsOneWidget);
//   //         });
//
// }