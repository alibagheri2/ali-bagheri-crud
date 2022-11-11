import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mycrud/models/info_models.dart';

import '../controllers/info_controller.dart';
import '../controllers/info_feild_controller.dart';
import 'package:validators/validators.dart';

class Add_New_Customers extends StatelessWidget {
  Add_New_Customers({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
          body: Stack(
            children: [
              const background(),
              Column(
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  const firstname_feild(),
                  const lastname_feild(),
                  const birthday_feild(),
                  //phonenumber
                  Container(
                    margin: const EdgeInsets.only(right: 50, left: 50, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value){
                        if(RegExp(r'^(\98?)?{?(0?9[0-9]{9,9}}?)$').hasMatch(value!))
                        {return null;}
                        else{return 'Enter Iran PhoneNumber';}
                      },
                      controller: Get.find<info_feild_controller>().phonenumber,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        hintText: 'Phone Number',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                      ),
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                    ),
                  ),
                  //email
                  Container(
                    margin: const EdgeInsets.only(right: 50, left: 50, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (isEmail(value!)) {
                          return null;
                        } else {
                          return 'Enter a Valid Email';
                        }
                      },
                      controller: Get.find<info_feild_controller>().email,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: 'Email',
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent)),
                      ),
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                    ),
                  ),
                  const banckacountnumber_feild(),
                  const SizedBox(height: 100,),
                  //add/edit-button
                  Container(
                    margin: const EdgeInsets.only(right: 30, left: 30),
                    width: Get.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey.shade800),
                      onPressed: () {
                        //fill_gaps
                        if(  Get.find<info_feild_controller>().firstname.text=='' ||
                            Get.find<info_feild_controller>().lastname.text=='' ||
                            Get.find<info_feild_controller>().birthday.text==''||
                            Get.find<info_feild_controller>().banckacountnumber.text==''||
                            Get.find<info_feild_controller>().email.text==''||
                            Get.find<info_feild_controller>().phonenumber.text==''
                        ){Get.snackbar('Error', 'Please Fill Gaps',duration: const Duration(seconds: 4),colorText: Colors.red);}

                        else
                        //check_validation
                        {
                          if (_formKey.currentState?.validate() ?? true)
                        //update_info
                        {
                          final list = Get.find<info_controller>().list;
                          if (Get.find<info_controller>().isEditing.value) {
                            var info_edit = Get.find<info_controller>()
                                .list[Get.find<info_controller>().index];
                            info_edit.phonenumber =
                                Get.find<info_feild_controller>()
                                    .phonenumber
                                    .text;
                            info_edit.email =
                                Get.find<info_feild_controller>().email.text;
                            info_edit.banckacountnumber =
                                Get.find<info_feild_controller>()
                                    .banckacountnumber
                                    .text;
                            final firstname = Get.find<info_feild_controller>()
                                .firstname
                                .text;

                            final birthday = Get.find<info_feild_controller>()
                                .birthday
                                .text;
                            final lastname = Get.find<info_feild_controller>()
                                .lastname
                                .text;
                            info_edit.firstname = firstname;
                            info_edit.lastname = lastname;
                            info_edit.birthday = birthday;
                            Get.find<info_controller>()
                                .list[Get.find<info_controller>().index] = info_edit;
                            Get.back();
                          }
                          else
                          //add_info
                          {

                            list.add(infomodel(

                                firstname: Get.find<info_feild_controller>()
                                    .firstname
                                    .text,
                                lastname: Get.find<info_feild_controller>()
                                    .lastname
                                    .text,
                                birthday: Get.find<info_feild_controller>()
                                    .birthday
                                    .text,
                                phonenumber: Get.find<info_feild_controller>()
                                    .phonenumber
                                    .text,
                                email: Get.find<info_feild_controller>()
                                    .email
                                    .text,
                                banckacountnumber:
                                Get.find<info_feild_controller>()
                                    .banckacountnumber
                                    .text));
                            Get.back();
                            Get.snackbar('Attention', 'Long Press on Items to Edit',duration: const Duration(seconds: 5),
                            colorText:Colors.orangeAccent,snackPosition:SnackPosition.BOTTOM,backgroundColor: Colors.black );
                          }
                        } else {
                          return;
                        }}
                      },
                      child: Get.find<info_controller>().isEditing.value
                          ? const Text('Update')
                          : const Text('add'),
                    ),
                  )
                ],
              )
            ],
          ),
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
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Image.asset(
        'assets/images/background.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}

class firstname_feild extends StatelessWidget {
  const firstname_feild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50),
      child: TextFormField(
        validator: (value){
          if(Get.find<info_controller>().isEditing.value){
            if(Get.find<info_controller>().list.any((element) => element.firstname == value) &&
                Get.find<info_controller>().list[Get.find<info_controller>().index].firstname!=value
            ){
              return 'This Firstname exists';
            }
          }else if(!Get.find<info_controller>().isEditing.value)
          {
            if(Get.find<info_controller>().list.any((element) => element.firstname == value)
            ){
              return 'This Firstname exists';
            }
          }

        },
        controller: Get.find<info_feild_controller>().firstname,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
          hintText: 'First Name ',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
        ),
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
      ),
    );
  }
}

class lastname_feild extends StatelessWidget {
  const lastname_feild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, top: 10),
      child: TextFormField(
        validator: (value){
          if(Get.find<info_controller>().isEditing.value){
            if(Get.find<info_controller>().list.any((element) => element.lastname == value) &&
                Get.find<info_controller>().list[Get.find<info_controller>().index].lastname!=value
            ){
              return 'This Lastname exists';
            }
          }else if(!Get.find<info_controller>().isEditing.value)
          {
            if(Get.find<info_controller>().list.any((element) => element.lastname == value)
            ){
              return 'This Lastname exists';
            }
          }

        },
        controller: Get.find<info_feild_controller>().lastname,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.black,
          ),
          hintText: 'Last Name',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
        ),
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
      ),
    );
  }
}

class birthday_feild extends StatelessWidget {
  const birthday_feild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, top: 10),
      child: TextFormField(
        validator: (value){
          if(Get.find<info_controller>().isEditing.value){
            if(Get.find<info_controller>().list.any((element) => element.birthday == value) &&
                Get.find<info_controller>().list[Get.find<info_controller>().index].birthday!=value
            ){
              return 'This Date exists';
            }
          }else if(!Get.find<info_controller>().isEditing.value)
          {
            if(Get.find<info_controller>().list.any((element) => element.birthday == value)
            ){
              return 'This Date exists';
            }
          }

        },
        controller: Get.find<info_feild_controller>().birthday,
          onTap: () async {
            await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1952),
              lastDate: DateTime(2023),
            ).then((selectedDate) {
              if (selectedDate != null) {
                Get.find<info_feild_controller>().birthday.text =
                    DateFormat('yyyy-MM-dd').format(selectedDate);
              }
            });
          },
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.calendar_month_outlined,
            color: Colors.black,
          ),
          hintText: 'Date OF Birth',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
        ),
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
      ),
    );
  }
}

class banckacountnumber_feild extends StatelessWidget {
  const banckacountnumber_feild({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 50, left: 50, top: 10),
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: Get.find<info_feild_controller>().banckacountnumber,
        decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.monetization_on_outlined,
            color: Colors.black,
          ),
          hintText: 'Bank Account Number',
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.redAccent)),
        ),
        style: const TextStyle(color: Colors.black),
        cursorColor: Colors.black,
      ),
    );
  }
}


