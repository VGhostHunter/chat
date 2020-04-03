import 'package:chat/screens/home_screen.dart';
import 'package:chat/utils/colors_util.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF4A4A58),
        accentColor: ColorsUtil.hexColor(0x425066),
        //按钮按下去的背景
        highlightColor: Color.fromRGBO(65, 65, 77, 0.5),
        //水波纹的颜色
        splashColor: ColorsUtil.hexColor(0xc2ccd0)
      ),
      home: HomeScreen(),
    );
  }
}