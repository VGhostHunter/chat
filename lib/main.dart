import 'package:chat/constants.dart';
import 'package:chat/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
//        primaryColor: kPrimaryColor,
//        accentColor: kAccentColor,
//        //按钮按下去的背景
//        highlightColor: kHighlightColor,
//        //水波纹的颜色
//        splashColor: kSplashColor
      ),
      home: LoginScreen(),
    );
  }
}