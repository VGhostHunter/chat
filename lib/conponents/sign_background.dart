import 'package:flutter/material.dart';

class SignBackGround extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              stops: [
                0.0,
                1.0
              ],
              colors: [
                Colors.black26,
                Colors.black87,
              ]
          )
        ),
      ),
    );
  }
}