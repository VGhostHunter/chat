import 'package:chat/conponents/sign_background.dart';
import 'package:chat/widgets/flare_sign_in_controller.dart';
import 'package:chat/conponents/signin_button.dart';
import 'package:chat/widgets/tracking_text_input.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FlareSignInController _signInController;

  @override
  void initState() {
    _signInController = FlareSignInController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black54,
        ),
        child: Container(
          child: Stack(
            children: <Widget>[
              SignBackGround(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 150,
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: FlareActor(
                      'assets/Teddy.flr',
                      shouldClip: false,
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.contain,
                      controller: _signInController,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25.0)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(25.0, 15, 25, 20),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TrackingTextInput(
                                label: 'Username',
                                hint: 'your username',
                                onCaretMoved: (Offset caret) {
                                  _signInController.lookAt(caret);
                                },
                                onTextChanged: (String value) {
                                  _signInController.setUsername(value);
                                },
                              ),
                              TrackingTextInput(
                                label: 'Password',
                                hint: 'your password',
                                isObscured: true,
                                onCaretMoved: (Offset caret) {
                                  _signInController.coverEyes(caret != null);
                                  _signInController.lookAt(null);
                                },
                                onTextChanged: (String value) {
                                  _signInController.setPassword(value);
                                },
                              ),
                              SignInButton(
                                onPressed: () => Navigator.push(context, MaterialPageRoute(
                                  builder: (_) => _signInController.submitPassword(),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}