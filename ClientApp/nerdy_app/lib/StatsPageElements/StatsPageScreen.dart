import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../PageResizing/WidgetResizing.dart';
import '../PageResizing/Variables.dart';
import '../ProfilePageElements/ProfilePageScreen.dart';

class StatsPageScreen extends StatelessWidget {
  const StatsPageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
            onWillPop: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePageScreen()));
            },
            child: _StatsPageScreen()),
      ),
    );
  }
}

class _StatsPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: boxSizeH * 100,
      height: boxSizeV * 100,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/STATS.png'), fit: BoxFit.fill),
      ),
      child: Stack(
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, 64 * boxSizeV),
            child: Divider(
              thickness: 1,
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 5.3 * boxSizeH,
              right: 5.3 * boxSizeH,
              top: 2.8 * boxSizeV,
            ),
            width: boxSizeH * 100,
            height: boxSizeV * 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 2 * boxSizeH,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Working');
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilePageScreen()));
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Stats',
                      style: TextStyle(
                          fontSize: 3 * boxSizeV,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 53 * boxSizeH,
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        color: Colors.white,
                        iconSize: 5 * boxSizeV,
                        icon: Icon(FontAwesomeIcons.solidHeart),
                        onPressed: () {
                          print('Workinig');
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfilePageScreen()));
                        }),
                  ],
                ),
                Container(
                  height: 52 * boxSizeV,
                  padding:
                      EdgeInsets.only(left: 5 * boxSizeH, right: 5 * boxSizeH),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("Working");
                            },
                            child: Container(
                              height: 25 * boxSizeV,
                              width: 38 * boxSizeH,
                              padding: EdgeInsets.only(
                                  left: 2 * boxSizeH,
                                  top: 2 * boxSizeV,
                                  bottom: 2 * boxSizeV,
                                  right: 2 * boxSizeH),
                              decoration: BoxDecoration(
                                  color: Color(0xff5A77EC),
                                  borderRadius:
                                      BorderRadius.circular(5 * boxSizeV)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 8 * boxSizeV,
                                    padding: EdgeInsets.all(1 * boxSizeV),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.thumbsUp,
                                      color: Color(0xff5A77EC),
                                    ),
                                  ),
                                  SizedBox(height: 4 * boxSizeV),
                                  Text(
                                    "Likes",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (4.6 * boxSizeH)
                                              : (2.6 * boxSizeV),
                                    ),
                                  ),
                                  Text(
                                    "This Week",
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (2.6 * boxSizeV)
                                              : (4.6 * boxSizeH),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Working");
                            },
                            child: Container(
                              height: 25 * boxSizeV,
                              width: 38 * boxSizeH,
                              padding: EdgeInsets.only(
                                  left: 2 * boxSizeH,
                                  top: 2 * boxSizeV,
                                  bottom: 2 * boxSizeV,
                                  right: 2 * boxSizeH),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: <Color>[
                                    Color(0xffE65D91),
                                    Color(0xffF1EBEB),
                                    Color(0xffF3F3F3)
                                  ], stops: <double>[
                                    0.0,
                                    0.3,
                                    1.0
                                  ], begin: Alignment.topRight),
                                  borderRadius:
                                      BorderRadius.circular(5 * boxSizeV)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(-11 * boxSizeH, 0),
                                    child: Container(
                                      height: 8 * boxSizeV,
                                      padding: EdgeInsets.all(1 * boxSizeV),
                                      decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Color(0x8A000000),
                                              offset: Offset(0, 1 * boxSizeV),
                                              blurRadius: 2 * boxSizeV)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Center(
                                            child: Icon(
                                              FontAwesomeIcons.solidHeart,
                                              color: Color(0xffED5565),
                                              size: 4.5 * boxSizeV,
                                            ),
                                          ),
                                          Center(
                                            child: Icon(
                                              FontAwesomeIcons.baseballBall,
                                              color: Color(0xffE6E9ED),
                                              size: 2 * boxSizeV,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4 * boxSizeV),
                                  Text(
                                    "Likes",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (4.6 * boxSizeH)
                                              : (2.6 * boxSizeV),
                                    ),
                                  ),
                                  Text(
                                    "This Week",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (2.6 * boxSizeV)
                                              : (4.6 * boxSizeH),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          GestureDetector(
                            onTap: () {
                              print("Working");
                            },
                            child: Container(
                              height: 25 * boxSizeV,
                              width: 38 * boxSizeH,
                              padding: EdgeInsets.only(
                                  left: 2 * boxSizeH,
                                  top: 2 * boxSizeV,
                                  bottom: 2 * boxSizeV,
                                  right: 2 * boxSizeH),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: <Color>[
                                        Color(0xff5A77EC),
                                        Color(0xffFBF9F9),
                                        Color(0xffffffff)
                                      ],
                                      begin: Alignment.topRight,
                                      stops: <double>[0.0, 0.3, 1.0]),
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.circular(5 * boxSizeV)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 8 * boxSizeV,
                                    padding: EdgeInsets.all(1 * boxSizeV),
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            color: Color(0x8A000000),
                                            offset: Offset(0, 1 * boxSizeV),
                                            blurRadius: 2 * boxSizeV)
                                      ],
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Icon(
                                      FontAwesomeIcons.solidHeart,
                                      color: Color(0xffEAF124),
                                    ),
                                  ),
                                  SizedBox(height: 4 * boxSizeV),
                                  Text(
                                    "Likes",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (4.6 * boxSizeH)
                                              : (2.6 * boxSizeV),
                                    ),
                                  ),
                                  Text(
                                    "This Week",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (2.6 * boxSizeV)
                                              : (4.6 * boxSizeH),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Working");
                            },
                            child: Container(
                              height: 25 * boxSizeV,
                              width: 38 * boxSizeH,
                              padding: EdgeInsets.only(
                                  left: 2 * boxSizeH,
                                  top: 2 * boxSizeV,
                                  bottom: 2 * boxSizeV,
                                  right: 2 * boxSizeH),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: <Color>[
                                    Color(0xffEC9B5A),
                                    Color(0xffFFFFFF),
                                    Color(0xffFFFFFF)
                                  ], stops: <double>[
                                    0.0,
                                    0.35,
                                    1.0
                                  ], begin: Alignment.topRight),
                                  border: Border.all(),
                                  borderRadius:
                                      BorderRadius.circular(5 * boxSizeV)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Transform.translate(
                                    offset: Offset(-11 * boxSizeH, 0),
                                    child: Container(
                                      height: 8 * boxSizeV,
                                      padding: EdgeInsets.all(1 * boxSizeV),
                                      decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: Color(0x8A000000),
                                              offset: Offset(0, 1 * boxSizeV),
                                              blurRadius: 2 * boxSizeV)
                                        ],
                                        shape: BoxShape.circle,
                                        color: Color(0xffD929D9),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Center(
                                            child: Icon(
                                              FontAwesomeIcons.solidHeart,
                                              color: Colors.white,
                                              size: 4.5 * boxSizeV,
                                            ),
                                          ),
                                          Center(
                                            child: Icon(
                                              FontAwesomeIcons.baseballBall,
                                              color: Color(0xffE6E9ED),
                                              size: 2 * boxSizeV,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4 * boxSizeV),
                                  Text(
                                    "Likes",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (4.6 * boxSizeH)
                                              : (2.6 * boxSizeV),
                                    ),
                                  ),
                                  Text(
                                    "This Week",
                                    style: TextStyle(
                                      color: Colors.black54,
                                      fontSize:
                                          (4.6 * boxSizeH) > (2.6 * boxSizeV)
                                              ? (2.6 * boxSizeV)
                                              : (4.6 * boxSizeH),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 3 * boxSizeV),
                  width: 100 * boxSizeH,
                  height: 33 * boxSizeV,
                  padding: EdgeInsets.only(
                      left: 6.5 * boxSizeH, right: 5 * boxSizeH),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Potential Connections',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 4.5 * boxSizeV),
                      ),
                      SizedBox(height: boxSizeV / 2),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  print('Working');
                                },
                                child: Container(
                                  height: 4 * boxSizeV,
                                  decoration:
                                      BoxDecoration(color: Color(0xff5A77EC)),
                                  child: Center(
                                      child: Text(
                                    "This Week",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  print('Working');
                                },
                                child: Container(
                                  height: 4 * boxSizeV,
                                  decoration:
                                      BoxDecoration(color: Colors.white),
                                  child: Center(child: Text("This Month")),
                                ),
                              )),
                        ],
                      ),
                      SizedBox(height: boxSizeV / 2),
                      Container(
                        height: 22 * boxSizeV,
                        // color: Colors.red,
                        child: ListView.builder(
                          itemBuilder: (context, index) => LikedImages(),
                          itemCount: 8,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LikedImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          right: (5.23 * boxSizeH) / 2, left: (5 * boxSizeH) / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePageScreen()));
            },
            child: Container(
              width: (16 * boxSizeH) > (9.3 * boxSizeV)
                  ? (9.3 * boxSizeV)
                  : (16 * boxSizeH),
              height: (16 * boxSizeH) > (9.3 * boxSizeV)
                  ? (9.3 * boxSizeV)
                  : (16 * boxSizeH),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('images/Ducati_side_shadow.png'),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ProfilePageScreen()));
            },
            child: Container(
              width: (16 * boxSizeH) > (9.3 * boxSizeV)
                  ? (9.3 * boxSizeV)
                  : (16 * boxSizeH),
              height: (16 * boxSizeH) > (9.3 * boxSizeV)
                  ? (9.3 * boxSizeV)
                  : (16 * boxSizeH),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Image.asset('images/Ducati_side_shadow.png'),
            ),
          ),
        ],
      ),
    );
  }
}
