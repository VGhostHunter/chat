import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const SignInButton({
    Key key,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25.0),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: Colors.black38,
          onPressed: onPressed,
          child: Text(
            "Sign In",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
