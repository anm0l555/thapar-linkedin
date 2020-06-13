import 'package:app/PageNavigationAnimation/SlideDown.dart';
import 'package:flutter/material.dart';
import './LoginPageElements/SignIn.dart';

class Login1 extends StatelessWidget {
  final double boxSizeH;
  final double boxSizeV;

  const Login1({Key key, this.boxSizeH, this.boxSizeV}) : super(key: key);
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
                    image: AssetImage('images/Android Mobile – 0.png'),
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

class TopTrapeziumBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, (size.height / 45.423) * 34.84);
    path.lineTo(size.width / 2 + (size.width * 3.5) / 100, size.height);
    path.lineTo(
        size.width - (size.width * 5) / 100, (26.8 * size.height) / 45.423);
    path.quadraticBezierTo(size.width, (24 * size.height) / 45.423, size.width,
        (size.height * 22.34) / 45.423);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class TopTrapezium extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, (size.height / 62.67) * 43.55);
    path.quadraticBezierTo(-(1.6 * size.width) / 78, (47 * size.height) / 62.67,
        (size.width * 2.83) / 78, (size.height * 47.53) / 62.67);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class DownTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - (size.height * 7) / 24.3);
    path.quadraticBezierTo(
        size.width,
        size.height - (size.height * 10) / 24.3,
        size.width - (size.width * 5) / 78,
        size.height - (size.height * 11) / 24.3);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class RoundedButton extends StatelessWidget {
  RoundedButton(
      this.colour, this.actionName, this.onPress, this.height, this.minWidth);
  final Color colour;
  final String actionName;
  final Function onPress;
  final double height;
  final double minWidth;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: colour,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPress,
        minWidth: minWidth,
        height: height,
        child: Text(
          actionName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
// Transform.translate(
//               offset: Offset(
//                   -(boxSizeH * 60.75) / 2 + boxSizeH * 100 + boxSizeH * 5.875,
//                   boxSizeV * 53.5),
//               child: Container(
//                 height: boxSizeH * 60.75,
//                 width: boxSizeH * 60.75,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 60.75),
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(
//                   -(boxSizeH * 60.75) / 2 + boxSizeH * 100 + boxSizeH * 5.875,
//                   boxSizeV * 77.66),
//               child: Container(
//                 height: boxSizeH * 60.75,
//                 width: boxSizeH * 60.75,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 60.75),
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(
//                   boxSizeH * 60.75, -(boxSizeH * 60.75) / 2 + boxSizeV * 5),
//               child: Container(
//                 height: boxSizeH * 60.75,
//                 width: boxSizeH * 60.75,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 60.75),
//                   color: Color(0xADEC9B5A),
//                 ),
//               ),
//             ),
//             ClipPath(
//               clipper: TopTrapeziumBackground(),
//               child: Container(
//                 width: boxSizeH * 100,
//                 height: boxSizeV * 45.423,
//                 color: Colors.pink,
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(boxSizeH * 25, -(boxSizeH * 61.25) / 2),
//               child: Container(
//                 height: boxSizeH * 61.25,
//                 width: boxSizeH * 61.25,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 61.25),
//                   color: Colors.indigo,
//                 ),
//               ),
//             ),

//             Transform.translate(
//               offset: Offset(-(boxSizeH * 60.75) + boxSizeH * 28,
//                   -(boxSizeH * 60.75) / 2 + boxSizeV * 2.6),
//               child: Container(
//                 height: boxSizeH * 60.75,
//                 width: boxSizeH * 60.75,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 60.75),
//                   color: Colors.blue,
//                 ),
//               ),
//             ),
//             Transform.translate(
//               offset: Offset(-(boxSizeH * 52.5) + boxSizeH * 17, 0),
//               child: Container(
//                 height: boxSizeH * 52.5,
//                 width: boxSizeH * 52.5,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(boxSizeH * 52.5),
//                   color: Colors.green,
//                 ),
//               ),
//             ),

//             Padding(
//               padding: EdgeInsets.only(
//                 top: boxSizeV * 7.34,
//                 bottom: 0,
//                 right: boxSizeH * 11,
//                 left: boxSizeH * 11,
//               ),

//               child: Stack(
//                 children: <Widget>[
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       ClipShadow(
//                         clipper: TopTrapezium(),
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0.0, 3.0),
//                             blurRadius: 18.0,
//                             color: Colors.black,
//                           ),
//                         ],
//                         child: Container(
//                           width: 78 * boxSizeH,
//                           height: boxSizeV * 62.67,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(6 * boxSizeH)),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 top: 2 * boxSizeV,
//                                 bottom: 4 * boxSizeV,
//                                 left: 5 * boxSizeH,
//                                 right: 5 * boxSizeH),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: <Widget>[
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: <Widget>[
//                                     Text(
//                                       "LOGO",
//                                       style: TextStyle(
//                                         fontSize: 10 * boxSizeV,
//                                         color: Colors.white,
//                                         backgroundColor: Colors.blue,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 TextField(),
//                                 TextField(),
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: <Widget>[
//                                     GestureDetector(
//                                       child: Text("Forgot Password?"),
//                                       onTap: () {
//                                         print('forgot password');
//                                       },
//                                     ),
//                                     RoundedButton(
//                                         Colors.lightBlueAccent, 'Login', () {
//                                       print("Logged IN");
//                                     }, 7 * boxSizeV, 29 * boxSizeH),
//                                   ],
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: <Widget>[
//                                     FloatingActionButton(
//                                       onPressed: () {
//                                         print("Sign UP");
//                                       },
//                                       child: Icon(Icons.arrow_upward),
//                                     ),
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       ClipShadow(
//                         clipper: DownTriangle(),
//                         boxShadow: [
//                           BoxShadow(
//                             offset: Offset(0.0, 3.0),
//                             blurRadius: 18.0,
//                             color: Colors.black,
//                           )
//                         ],
//                         child: Container(
//                           width: 78 * boxSizeH,
//                           height: boxSizeV * 24.3,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(3 * boxSizeH)),
//                             color: Colors.white,
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.only(
//                                 top: 3 * boxSizeV, left: 2 * boxSizeH),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 FloatingActionButton(
//                                   onPressed: () {
//                                     print("Sign UP");
//                                   },
//                                   child: Icon(Icons.arrow_upward),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Transform.translate(
//                     offset: Offset(
//                         ((78 * boxSizeH) -
//                                 (3 *
//                                     (boxSizeH < (30 * boxSizeV)
//                                         ? (boxSizeV * 10)
//                                         : (15 * boxSizeH)))) /
//                             4,
//                         (boxSizeV * 62.67) -
//                             (boxSizeH < (30 * boxSizeV)
//                                     ? (boxSizeV * 15)
//                                     : (12.5 * boxSizeH)) /
//                                 2),
//                     child: Container(
//                       height: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       width: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           print('yo');
//                         },
//                         child: Icon(
//                           FontAwesomeIcons.facebookF,
//                           size: boxSizeH < (30 * boxSizeV)
//                               ? (boxSizeV * 5)
//                               : (7.5 * boxSizeH),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Transform.translate(
//                     offset: Offset(
//                         (78 * boxSizeH) / 2 -
//                             ((boxSizeH < (30 * boxSizeV)
//                                     ? (boxSizeV * 10)
//                                     : (15 * boxSizeH)) /
//                                 2),
//                         (3.16 * boxSizeV) +
//                             (boxSizeV * 62.67) -
//                             (boxSizeH < (30 * boxSizeV)
//                                     ? (boxSizeV * 12.8)
//                                     : (15 * boxSizeH)) /
//                                 2),
//                     child: Container(
//                       height: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       width: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           print('yo');
//                         },
//                         child: Icon(
//                           FontAwesomeIcons.googlePlusG,
//                           size: boxSizeH < (30 * boxSizeV)
//                               ? (boxSizeV * 5)
//                               : (7.5 * boxSizeH),
//                         ),
//                       ),
//                     ),
//                   ),

//                   Transform.translate(
//                     offset: Offset(
//                         (78 * boxSizeH) -
//                             (boxSizeH < (30 * boxSizeV)
//                                 ? (boxSizeV * 10)
//                                 : (15 * boxSizeH)) -
//                             (((78 * boxSizeH) -
//                                     (3 *
//                                         (boxSizeH < (30 * boxSizeV)
//                                             ? (boxSizeV * 10)
//                                             : (15 * boxSizeH)))) /
//                                 4),
//                         (boxSizeV * 62.67) +
//                             (boxSizeH < (30 * boxSizeV)
//                                     ? (boxSizeV * 4)
//                                     : (4.5 * boxSizeH)) /
//                                 2),
//                     child: Container(
//                       height: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       width: boxSizeH < (30 * boxSizeV)
//                           ? (boxSizeV * 10)
//                           : (15 * boxSizeH),
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           print('yo');
//                         },
//                         child: Icon(
//                           FontAwesomeIcons.twitter,
//                           size: boxSizeH < (30 * boxSizeV)
//                               ? (boxSizeV * 5)
//                               : (7.5 * boxSizeH),
//                         ),
//                       ),
//                     ),
//                   ),

//                 ],
//               ),
//             ),
