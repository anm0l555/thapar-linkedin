import 'package:flutter/material.dart';
import './LoginPageElements/SignInScreen.dart';
import './PageNavigationAnimation/SlideDown.dart';

class Signup extends StatelessWidget {
  final double boxSizeH;
  final double boxSizeV;

  const Signup({Key key, this.boxSizeH, this.boxSizeV}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(slideDown(SafeAreaConstraints()));
      },
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(0),
              width: boxSizeH * 100,
              height: boxSizeV * 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/Android Mobile – 1.png'),
                    fit: BoxFit.fill),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(slideDown(SafeAreaConstraints()));
                  },
                  child: Text(
                    "SIGNUP PAGE    CLICK TO GO BACK",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
