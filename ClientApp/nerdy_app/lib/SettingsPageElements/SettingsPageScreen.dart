import 'package:flutter/material.dart';
import '../PageResizing/WidgetResizing.dart';
import '../PageResizing/Variables.dart';
import '../ProfilePageElements/ProfilePageScreen.dart';

class SettingsPageScreen extends StatelessWidget {
  const SettingsPageScreen({Key key}) : super(key: key);

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
            child: _SettingsPageScreen()),
      ),
    );
  }
}

class _SettingsPageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 3.7 * boxSizeV,
      ),
      width: boxSizeH * 100,
      height: boxSizeV * 100,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/SETTINGS.png'), fit: BoxFit.fill),
      ),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Transform.translate(
                      offset: Offset(-(38 * boxSizeH), -(2.5 * boxSizeV)),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: (15 * boxSizeV) > (22 * boxSizeH)
                          ? 16 * boxSizeH
                          : 10 * boxSizeV,
                      width: (15 * boxSizeV) > (22 * boxSizeH)
                          ? 16 * boxSizeH
                          : 10 * boxSizeV,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Image.asset('images/Ducati_side_shadow.png'),
                    ),
                    Transform.translate(
                      offset: Offset(
                        (15 * boxSizeV) > (22 * boxSizeH)
                            ? 16 * boxSizeH / 1.5
                            : 10 * boxSizeV / 1.5,
                        (15 * boxSizeV) > (22 * boxSizeH)
                            ? 16 * boxSizeH / 1.3
                            : 10 * boxSizeV / 1.3,
                      ),
                      child: Container(
                        padding: EdgeInsets.zero,
                        height: (15 * boxSizeV) > (22 * boxSizeH)
                            ? 16 * boxSizeH / 3
                            : 10 * boxSizeV / 3,
                        width: (15 * boxSizeV) > (22 * boxSizeH)
                            ? 16 * boxSizeH / 3
                            : 10 * boxSizeV / 3,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1.5),
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: () {
                              print("Working");
                            },
                            child: Icon(
                              Icons.mode_edit,
                              size: (15 * boxSizeV) > (22 * boxSizeH)
                                  ? 16 * boxSizeH / 4.6
                                  : 10 * boxSizeV / 4.6,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 3 * boxSizeV),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'NAME',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 3.5 * boxSizeV),
                ),
              ],
            ),
            SizedBox(height: 0.5 * boxSizeV),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 3 * boxSizeV,
                  color: Colors.white,
                ),
                SizedBox(width: 1.5 * boxSizeH),
                Text(
                  'Chandigarh ,India',
                  style:
                      TextStyle(color: Colors.white, fontSize: 2.5 * boxSizeV),
                ),
              ],
            ),
            SizedBox(height: 7 * boxSizeV),
            Container(
              padding: EdgeInsets.only(
                  top: 4.5 * boxSizeV,
                  left: 10 * boxSizeH,
                  right: 10 * boxSizeH),
              height: 67.2 * boxSizeV,
              decoration: BoxDecoration(
                color: Color(0xff201D2E),
                // border: Border.all(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5 * boxSizeH),
                  topRight: Radius.circular(5 * boxSizeH),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Profile Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 3 * boxSizeV,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: boxSizeV,
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 2.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3 * boxSizeV,
                    ),
                    Text(
                      'Profile Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 3 * boxSizeV,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: boxSizeV,
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 2.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: .5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3 * boxSizeV,
                    ),
                    Text(
                      'Profile Settings',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 3 * boxSizeV,
                          fontWeight: FontWeight.w600),
                    ),
                    Divider(
                      height: boxSizeV,
                      thickness: 1.2,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 2.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0.5 * boxSizeV,
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Working");
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Theme',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 3 * boxSizeV,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 54 * boxSizeH,
                          ),
                          Text(
                            'Light',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 2 * boxSizeV,
                                fontWeight: FontWeight.w500),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 2.5 * boxSizeV,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
