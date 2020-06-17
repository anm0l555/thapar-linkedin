import 'package:flutter/material.dart';
import '../PageResizing/Variables.dart';
import '../PageResizing/WidgetResizing.dart';
import '../UploadPageElements/UploadPageScreen.dart';
import '../SettingsPageElements/SettingsPageScreen.dart';

class ProfilePageScreen extends StatelessWidget {
  const ProfilePageScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    boxSizeH = SizeConfig.safeBlockHorizontal;
    boxSizeV = SizeConfig.safeBlockVertical;
    return SafeArea(
      child: Scaffold(
        body: _ProfilePageScreen(),
      ),
    );
  }
}

class _ProfilePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => UploadScreen()));
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 5.3 * boxSizeH,
          right: 5.3 * boxSizeH,
          top: 2.8 * boxSizeV,
        ),
        width: boxSizeH * 100,
        height: boxSizeV * 100,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Myprofile.png'), fit: BoxFit.fill),
        ),
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
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Profile',
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
                    iconSize: 6 * boxSizeV,
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      print('Workinig');
                      Navigator.of(context).pop();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SettingsPageScreen()));
                    }),
              ],
            ),
            Container(
              margin:
                  EdgeInsets.only(left: 1.1 * boxSizeH, right: .5 * boxSizeH),
              height: 87 * boxSizeV,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6 * boxSizeV),
                child: SingleChildScrollView(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF201D2E),
                          borderRadius: BorderRadius.circular(6 * boxSizeV),
                        ),
                        padding: EdgeInsets.only(
                          top: (15 * boxSizeV) > (22 * boxSizeH)
                              ? 11 * boxSizeH
                              : 7.5 * boxSizeV,
                        ),
                        margin: EdgeInsets.only(
                          top: (15 * boxSizeV) > (22 * boxSizeH)
                              ? 11 * boxSizeH
                              : 7.5 * boxSizeV,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 2 * boxSizeV,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    print("Working");
                                  },
                                  child: Container(
                                    height: 5 * boxSizeV,
                                    width: 23 * boxSizeH,
                                    color: Color(0xFF5A77EC),
                                    child: Center(
                                      child: Text(
                                        'CONNECT',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 2 * boxSizeH,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("Working");
                                  },
                                  child: Container(
                                    height: 5 * boxSizeV,
                                    width: 23 * boxSizeH,
                                    color: Color(0xFF300A6A),
                                    child: Center(
                                      child: Text(
                                        'MESSAGE',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2 * boxSizeV,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Container(
                                  width: 22 * boxSizeH,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '2K',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Friends',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 30 * boxSizeH,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '10',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Photos',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 24 * boxSizeH,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        '88',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        'Comments',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1 * boxSizeV,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'Jessica Jones , 27',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize: 4 * boxSizeV,
                                      ),
                                    ),
                                    Text(
                                      'San Francisco, USA',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                        fontSize: 2.5 * boxSizeV,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1 * boxSizeV,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 3.9 * boxSizeH),
                              child: Divider(
                                height: 1 * boxSizeV,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 2 * boxSizeV,
                            ),
                            LongDescription(),
                            SizedBox(
                              height: 2 * boxSizeV,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8 * boxSizeH),
                              // decoration: BoxDecoration(border: Border.all()),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Album',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 5 * boxSizeH),
                                  ),
                                  SizedBox(
                                    height: 2 * boxSizeV,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) =>
                                        PicturesRow(index),
                                    itemCount: 5,
                                    scrollDirection: Axis.vertical,
                                    // 22*boxh
                                  )
                                  // 70*boxH
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.zero,
                          height: (15 * boxSizeV) > (22 * boxSizeH)
                              ? 22 * boxSizeH
                              : 15 * boxSizeV,
                          width: (15 * boxSizeV) > (22 * boxSizeH)
                              ? 22 * boxSizeH
                              : 15 * boxSizeV,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Image.asset('images/Ducati_side_shadow.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LongDescription extends StatefulWidget {
  @override
  _LongDescriptionState createState() => _LongDescriptionState();
}

class _LongDescriptionState extends State<LongDescription> {
  bool showMore = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: showMore ? (80 * boxSizeH) : (53 * boxSizeH),
              child: Text(
                'An artist of considerable range jdjnjnjfg jgjgfjgjf jfhjfhjjhjhj gjggjghjghgjhgghjhjg hjghjghgjh gjhjhgjghg',
                overflow:
                    showMore ? TextOverflow.visible : TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.2 * boxSizeV,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Text(
                  showMore ? 'Show less....' : 'Show more....',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF5A77EC),
                  ),
                ))
          ],
        ),
      ],
    );
  }
}

class PicturesRow extends StatelessWidget {
  final index;
  PicturesRow(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 22 * boxSizeH,
              height: 22 * boxSizeH,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5 * boxSizeH)),
              child: Image.asset('images/Ducati_side_shadow.png'),
            ),
            Container(
              width: 22 * boxSizeH,
              height: 22 * boxSizeH,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5 * boxSizeH)),
              child: Image.asset('images/Ducati_side_shadow.png'),
            ),
            Container(
              width: 22 * boxSizeH,
              height: 22 * boxSizeH,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5 * boxSizeH)),
              child: Image.asset('images/Ducati_side_shadow.png'),
            ),
          ],
        ),
        SizedBox(
          height: 2 * boxSizeV,
        ),
      ],
    );
  }
}
