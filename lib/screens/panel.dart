import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../provider/provider.dart';
import '../utils/labels.dart';
import '../utils/or.dart';
import '../utils/underlinedLabel.dart';
import 'login.dart';

class Panel extends StatefulWidget {
  const Panel({super.key});

  @override
  State<Panel> createState() => _PanelState();
}

final email = TextEditingController();

class _PanelState extends State<Panel> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AppState provider = Provider.of<AppState>(context);
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
                          SizedBox(
                            width: 2.w,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Column(
                        children: [
                          
                        ],
                      ),
                      Labels(label: "Audio to Text", color: Colors.black, size: 12, weight: FontWeight.bold, align: TextAlign.center),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/sound.png",height: 30.h,width: 30.w,color: Colors.white,),
                                Text("to"),
                                Image.asset("assets/text.png",height: 30.h,width: 30.w,color: Colors.white,),
                              ],
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff161513)),
                            ),
                          )),
                      SizedBox(
                        height: 15.h,
                      ),
                                            Labels(label: "Video to Text", color: Colors.black, size: 12, weight: FontWeight.bold, align: TextAlign.center),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                          height: 48.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset("assets/video.png",height: 30.h,width: 30.w,color: Colors.white,),
                                Text("to"),
                                Image.asset("assets/text.png",height: 30.h,width: 30.w,color: Colors.white,),
                              ],
                            ),
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
                        onTap: (){
                           Navigator.pop(context);
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
                      Labels(
                          label: "Welcome ${provider.username}",
                          color: Color(0xffFBFCF8),
                          size: 15,
                          weight: FontWeight.w700,
                          align: TextAlign.justify),
                      GestureDetector(
                        onTap: (){},
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
          ],
        )),
      ),
    );
  }
}
