import 'dart:async';
import 'package:abcd/screens/login.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'Splash Screen',
	theme: ThemeData(
		primarySwatch: Colors.green,
	),
	home: MyHomePage(),
	debugShowCheckedModeBanner: false,
	);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 2),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														LogIn()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return Container(

   height: double.infinity,
   width: double.infinity,
   decoration: BoxDecoration(
    color: Colors.white,
    image: DecorationImage(image: AssetImage("assets/logo1.jpeg"),fit:BoxFit.contain)
   ),
	);
}
}
