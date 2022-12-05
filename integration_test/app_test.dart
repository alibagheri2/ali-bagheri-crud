import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mycrud/main.dart';
import 'package:mycrud/pages/add_new_customers.dart';
import 'package:mycrud/pages/cusromerslist.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('there is no char in fields so do not add anything to customers list',
          (WidgetTester tester) async{
           await tester.pumpWidget(MyApp());
           await tester.tap(find.byType(FloatingActionButton));
           await tester.pumpAndSettle();

           expect(find.byType(Add_New_Customers), findsOneWidget);
           expect(find.byType(CustomersList), findsNothing);

           await tester.tap(find.byKey(const Key('add_button')));
           await tester.pumpAndSettle();

           expect(find.byType(Add_New_Customers),findsOneWidget);
           expect(find.byType(CustomersList),findsNothing);
           expect(find.text('Please Fill Gaps'), findsOneWidget);

           await tester.pump(Duration(seconds: 5));
           await tester.pumpAndSettle();

           await tester.tap(find.byKey(const Key('back')));
           await tester.pumpAndSettle();

           expect(find.byType(Add_New_Customers),findsNothing);
           expect(find.byType(CustomersList),findsOneWidget);
          });
  testWidgets("""lets fill gaps
               and press add button to see the new customer added
               at the customerslist page
               and when ever we want to edit that we just need to log press on that tile
               and see all related infos at add_new_customers page""",
          (WidgetTester tester) async{
            const input_name='hi';
            const input_num='09134445566';
            const input_email='a@yahoo.com';
            const input_date='2022-01-01';

           await tester.pumpWidget(MyApp());

           await tester.tap(find.byType(FloatingActionButton));
           await tester.pumpAndSettle();

            expect(find.byType(Add_New_Customers), findsOneWidget);
            expect(find.byType(CustomersList), findsNothing);

           await tester.enterText(find.byKey(const Key('first name')), input_name);
           await tester.enterText(find.byKey(const Key('phone number')), input_num);
           await tester.enterText(find.byKey(const Key('email')), input_email);
           await tester.enterText(find.byKey(const Key('last name')), input_name);
           await tester.enterText(find.byKey(const Key('birthday')), input_date);
           await tester.enterText(find.byKey(const Key('b.a.n')), input_num);

           await tester.tap(find.byKey(const Key('add_button')));
           await tester.pumpAndSettle();

           expect(find.text('Long Press on Items to Edit'), findsOneWidget);
           expect(find.byType(CustomersList),findsOneWidget);
           expect(find.byType(Add_New_Customers),findsNothing);


            await tester.longPress(find.byKey(const Key('list item')));
            await tester.pumpAndSettle();

            expect(find.byType(Add_New_Customers), findsOneWidget);
            expect(find.byType(CustomersList), findsNothing);

            expect(find.byKey(const Key('first name')), findsOneWidget);
            expect(find.byKey(const Key('phone number')), findsOneWidget);
            expect(find.byKey(const Key('email')), findsOneWidget);
            expect(find.byKey(const Key('last name')), findsOneWidget);
            expect(find.byKey(const Key('birthday')), findsOneWidget);
            expect(find.byKey(const Key('b.a.n')), findsOneWidget);

          });
}