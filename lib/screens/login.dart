import 'dart:async';
import 'package:abcd/screens/panel.dart';
import 'package:abcd/screens/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../provider/provider.dart';
import '../utils/labels.dart';
import '../utils/or.dart';
import '../utils/underlinedLabel.dart';
import 'forgotPassword.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

bool value = true;
bool value1 = true;
final password = TextEditingController();
final email = TextEditingController();

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  @override
  bool status =false;
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);
    log_in() async {
      setState(() {
        status=true;
      });
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: email.text, password: password.text);
         if (userCredential.user!.emailVerified==true) {
          var data = await FirebaseFirestore.instance.
          collection("vendors").
          doc(userCredential.user!.uid). 
          get();
          provider.address=data['address'];
          provider.email=data['email'];
          provider.username=data['username'];
          provider.uid=data['uid'];
          provider.phone=data['phone'];
                  Navigator.push(
            context, MaterialPageRoute(builder: (context) => Panel()));
         }
         else{
          Fluttertoast.showToast(
        msg: "Your Account is not verified ",
        toastLength: Toast.LENGTH_SHORT,
      );
         }
         
        email.clear();
        password.clear();

      } on  FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: "$e",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
     setState(() {
        status=false;
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Stack(
              clipBehavior: Clip.none,
          children: [
           
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100.h,
                            width: 100.w,
                            child: Image.asset("assets/logo1.jpeg"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Center(
                                  child: TextFormField(
                                    controller: email,
                                    cursorColor: Colors.black,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Please enter an email';
                                      }
                                      if (!value.contains('@')) {
                                        return 'Please enter a valid email';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: Icon(Icons.mail_outline,
                                              color: Color(0xff2C599D)),
                                        ),
                                        labelText: "Email",
                                        labelStyle:
                                            TextStyle(color: Color(0xff2C599D)),
                                        focusColor: Colors.red,
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "abc@xyz.com"),
                                  ),
                                )),
                            SizedBox(
                              height: 15.h,
                            ),
                            Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Colors.white),
                                child: Center(
                                  child: TextFormField(
                                    controller: password,
                                    cursorColor: Colors.black,
                                    obscureText: value,
                                    decoration: InputDecoration(
                                        suffixIcon: IconButton(
                                          icon: value == true
                                              ? Icon(Icons.visibility_off,
                                                  color: Color(0xff2C599D))
                                              : Icon(Icons.visibility,
                                                  color: Color(0xff2C599D)),
                                          onPressed: () {
                                            setState(() {
                                              value = !value;
                                            });
                                          },
                                        ),
                                        suffixIconColor: value == true
                                            ? Colors.blue
                                            : Colors.grey,
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.only(right: 5.w),
                                          child: Icon(Icons.key_outlined,
                                              color: Color(0xff2C599D)),
                                        ),
                                        labelText: "Password",
                                        labelStyle: TextStyle(
                                          color: Color(0xff2C599D),
                                        ),
                                        focusColor: Color(0xff2C599D),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: "Password"),
                                  ),
                                )),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(),
                                GestureDetector(
                                  child: UnderlineLabels(
                                      label: "forgot password?",
                                      color: Color(0xff161513),
                                      size: 10,
                                      weight: FontWeight.w600,
                                      align: TextAlign.right),
                                  onTap: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Forgot()));
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              log_in();
                            },
                            child: Text("Login"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff161513)),
                            ),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                      OR(),
                      SizedBox(
                        height: 15.h,
                      ),
                      Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text("Sign Up"),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff161513)),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
             Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xff161513),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.r),
                      bottomRight: Radius.circular(15.r),
                    )),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: GestureDetector(
                           onTap: (){
                            //  Navigator.pushReplacement(
                            //                         context,
                            //                         MaterialPageRoute(
                            //                             builder: (context) =>
                            //                                 InitialScreen()));
                          },
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: Color(0xffFBFCF8),
                            child: Icon(
                              Icons.arrow_back,
                              color: Color(0xff161513),
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                      Labels(
                          label: "Log In",
                          color: Color(0xffFBFCF8),
                          size: 15,
                          weight: FontWeight.w700,
                          align: TextAlign.justify),
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 12.r,
                          backgroundColor: Color(0xffFBFCF8),
                          child: Icon(
                            Icons.help_outline,
                            color: Color(0xff161513),
                            size: 20.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
             status==false?Container(): Align(
              alignment: Alignment.center,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: Color(0xff034047).withOpacity(0.6),
                child: Center(
                  child: Container(
                    height: 120.h,
                    width: 120.w,
                     decoration: BoxDecoration(
                      color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Color(0xff034047),width: 2)
                          ),
                    child: Stack(
                      children: [
                        
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                          height: 70.h,
                          width: 70.w,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(15.r),
                          //   border: Border.all(color: Colors.white,width: 2)
                          // ),
                          child:Image.asset('assets/logo1.jpeg',height: 20.h,width: 20.w,)
                        ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 90.h,
                            width: 90.w,
                            child: CircularProgressIndicator(
                              
                              color: Color.fromARGB(255, 0, 0, 0),),
                          )),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
