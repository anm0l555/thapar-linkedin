import 'package:flutter/material.dart';
import '../LoginPageElements/SignInScreen.dart';
import '../PageResizing/WidgetResizing.dart';
import '../PageResizing/Variables.dart';
import '../ProfilePageElements/ProfilePageScreen.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key key}) : super(key: key);

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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SafeAreaConstraints()));
            },
            child: _UploadScreen()),
      ),
    );
  }
}

class _UploadScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 4 * boxSizeH,
        right: 4 * boxSizeH,
        top: 4.2 * boxSizeV,
        bottom: 3.25 * boxSizeV,
      ),
      width: boxSizeH * 100,
      height: boxSizeV * 100,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/Upload.png'), fit: BoxFit.fill),
      ),
      child: Stack(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "GOT SOMETHING NEW??\nUPLOAD IT HERE!!!",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 6.98 * boxSizeH,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 16.6 * boxSizeV,
              left: 3 * boxSizeH,
            ),
            child: Text(
              'Popular',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20.5 * boxSizeV,
            ),
            child: Container(
              height: 13 * boxSizeV,
              child: ListView.builder(
                itemBuilder: (context, index) => LikedImages(),
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 36.3 * boxSizeV),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    UploadingContainers(
                      heading: 'Upload a\nPhoto',
                      description:
                          'Upload a photo and see similar looking people',
                    ),
                    UploadingContainers(
                      heading: 'Invite a\nDate',
                      description:
                          'Upload a photo and see similar looking people',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    UploadingContainers(
                      heading: 'Upload a\nPhoto',
                      description:
                          'Upload a photo and see similar looking people',
                    ),
                    UploadingContainers(
                      heading: 'Invite a\nDate',
                      description:
                          'Upload a photo and see similar looking people',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadingContainers extends StatelessWidget {
  final String heading;
  final String description;
  UploadingContainers({this.description, this.heading});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Working");
      },
      child: Container(
        width: 40.7 * boxSizeH,
        height: 26.3 * boxSizeV,
        padding: EdgeInsets.only(
            left: 8.2 * boxSizeH,
            top: 6.6 * boxSizeV,
            bottom: 2 * boxSizeV,
            right: 2 * boxSizeH),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              heading,
              style: TextStyle(
                color: Colors.white,
                fontSize: (4.6 * boxSizeH) > (2.6 * boxSizeV)
                    ? (4.6 * boxSizeH)
                    : (2.6 * boxSizeV),
              ),
            ),
            Text(
              description,
              style: TextStyle(
                color: Colors.white,
                fontSize: (4.6 * boxSizeH) > (2.6 * boxSizeV)
                    ? (2.6 * boxSizeV)
                    : (4.6 * boxSizeH),
              ),
            ),
          ],
        ),
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
      height: 10.8 * boxSizeV,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ProfilePageScreen()));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
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
            Text(
              "Name",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
