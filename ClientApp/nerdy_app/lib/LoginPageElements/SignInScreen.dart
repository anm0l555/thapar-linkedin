import 'package:flutter/material.dart';
import '../PageResizing/Variables.dart';
import '../PageResizing/WidgetResizing.dart';
import '../PageNavigationAnimation/SlideUp.dart';
import '../TrashedPage.dart';
import '../UploadPageElements/UploadPageScreen.dart';

class SafeAreaConstraints extends StatelessWidget {
  const SafeAreaConstraints({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          left: 5.5 * boxSizeH,
          right: 3.6 * boxSizeH,
          top: 28.2 * boxSizeV,
          bottom: 2.6 * boxSizeV,
        ),
        width: boxSizeH * 100,
        height: boxSizeV * 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Android Mobile – 1.png'),
              fit: BoxFit.fill),
        ),
        child: Stack(
          children: <Widget>[
            Transform.translate(
              offset: Offset(4.2 * boxSizeH, 0),
              child: Container(
                padding: EdgeInsets.only(left: 2 * boxSizeH, top: boxSizeV / 2),
                decoration: BoxDecoration(
                  border: Border.all(),
                  // color: Colors.blue,
                ),
                width: 83 * boxSizeH,
                child: TextField(
                  style: TextStyle(
                    fontSize: 3.8 * boxSizeV,
                  ),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.tag_faces,
                      size: 5.5 * boxSizeV,
                    ),
                    border: InputBorder.none,
                    hintText: 'Username',
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(4.2 * boxSizeH, 13.5 * boxSizeV),
              child: Container(
                padding: EdgeInsets.only(left: 2 * boxSizeH, top: boxSizeV / 2),
                decoration: BoxDecoration(
                  border: Border.all(),
                  // color: Colors.green,
                ),
                width: 83 * boxSizeH,
                child: TextField(
                  style: TextStyle(
                    fontSize: 3.8 * boxSizeV,
                  ),
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.vpn_key,
                      size: 5.5 * boxSizeV,
                    ),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(3.9 * boxSizeH, 25.3 * boxSizeV),
              child: GestureDetector(
                onTap: () {
                  print("Working");
                },
                child: Container(
                  width: 33.5 * boxSizeH,
                  height: 4.1 * boxSizeV,
                  decoration: BoxDecoration(
                      // color: Colors.yellow,
                      ),
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 2.5 * boxSizeV,
                    ),
                  ),
                ),
              ),
            ),
            SocialButtons(a: 5.32, b: 48.65),
            SocialButtons(a: 25.5, b: 55.35),
            SocialButtons(a: 45.7, b: 61.23),
            NavigationCircleButtons(
              a: 0,
              b: 62.9,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(slideUp(Signup(
                  boxSizeH: boxSizeH,
                  boxSizeV: boxSizeV,
                )));
              },
            ),
            NavigationCircleButtons(
              a: 81.7,
              b: 58.3,
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(slideUp(Signup(
                  boxSizeH: boxSizeH,
                  boxSizeV: boxSizeV,
                )));
              },
            ),
            Transform.translate(
              offset: Offset(30.2 * boxSizeH, 35.6 * boxSizeV),
              child: GestureDetector(
                onTap: () {
                  print("LOGIN");
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => UploadScreen()));
                },
                child: Container(
                  height: 8 * boxSizeV,
                  width: 57 * boxSizeH,
                  decoration: BoxDecoration(
                    // border: Border.all(),
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(8 * boxSizeV),
                  ),
                  child: Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                        fontSize: 4 * boxSizeV,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NavigationCircleButtons extends StatelessWidget {
  final double a, b;
  final Function onTap;
  NavigationCircleButtons({this.a, this.b, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(a * boxSizeH, b * boxSizeV),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 9.1 * boxSizeH,
          height: 5.1 * boxSizeV,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.elliptical(9.1 * boxSizeH, 5.1 * boxSizeV),
            ),
            // color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  final double a, b;
  SocialButtons({this.a, this.b});
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(a * boxSizeH, b * boxSizeV),
      child: GestureDetector(
        onTap: () {
          print("Working");
        },
        child: Container(
          width: 14.2 * boxSizeH,
          height: 8 * boxSizeV,
          decoration: BoxDecoration(
            // color: Colors.yellow,
            borderRadius: BorderRadius.all(
              Radius.elliptical(14.2 * boxSizeH, 8 * boxSizeV),
            ),
          ),
        ),
      ),
    );
  }
}
