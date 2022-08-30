import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/Trustee.dart';
import 'package:masjit_vendor_app/feature/presentation/privacy_policy.dart';
import 'package:masjit_vendor_app/feature/presentation/sahr_iftar.dart';
import 'package:masjit_vendor_app/feature/presentation/terms_and_condition.dart';
import 'package:masjit_vendor_app/feature/presentation/weekly_namaz_timing.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';
import 'Notice.dart';
import 'eid_counting.dart';
import 'masjit_vendor_registration_from.dart';

class ShareSendGalleryImage extends StatefulWidget {
  ShareSendGalleryImage({Key? key}) : super(key: key);

  @override
  _ShareSendGalleryImageState createState() => _ShareSendGalleryImageState();
}

class _ShareSendGalleryImageState extends State<ShareSendGalleryImage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
              child: IconButton(
                icon: Image.asset(
                  "assets/images/drower.png",
                  height: SizeConfig.screenHeight * 15,
                  width: SizeConfig.screenWidth * 34,
                ),

                /* Image(image: AssetImage("assets/images/drower.png"),),*/
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            );
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
          child: Center(
            child: Text(
              "Weekly Namaz",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                  fontFamily: 'Roboto_Bold',
                  letterSpacing: SizeConfig.screenWidth * 0.00,
                  fontWeight: FontWeight.w400,
                  color: CommonColor.WHITE_COLOR),
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WeeklyNamazTiming()));
            },
            onDoubleTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                  right: SizeConfig.screenWidth * 0.02,
                  top: SizeConfig.screenHeight * 0.02),
              child: Container(
                width: SizeConfig.screenWidth * .15,
                child: Image.asset(
                  'assets/images/appBarIcon.png',
                ),
              ),
            ),
          )
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR]),
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
      padding: EdgeInsets.only(bottom: SizeConfig.screenHeight*0.03),
      children: [
        getAddFazarLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddzoharLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddAsarLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddMagribLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddFazarSecoundLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddIshaLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
        getAddJumaLayout(SizeConfig.screenHeight, SizeConfig.screenWidth)



      ]),

      drawer: Padding(
        padding: EdgeInsets.only(top:SizeConfig.screenHeight*0.06),
        child: Container(
          height: SizeConfig.screenHeight * .98,
          width: SizeConfig.screenHeight * .4,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30.0),
            ),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 110,
                    child: DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            CommonColor.LEFT_COLOR,
                            CommonColor.RIGHT_COLOR
                          ])),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 6),
                        child: Text(
                          "User Name  \n City",
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto_Medium',
                              fontWeight: FontWeight.w700,
                              color: CommonColor.WHITE_COLOR),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                     /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareSendGalleryImage(),
                        ),
                      );*/
                    },

                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Weekley Namaz Time",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SahrIftar() ));
                    },
                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "SAR / IFTAR",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
    onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EidCounting()));
    },
                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Eid",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Notice()));
                    },


                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Notice",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Trustee()));
                    },

                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Trustee",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),

                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                    },

                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => TermsAndCondition()));
                    },

                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Terms & Condition",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => registration()));
                    },

                    // leading: Icon(Icons.message),
                    title: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Roboto_Medium',
                            fontWeight: FontWeight.w500,
                            color: CommonColor.REGISTRARTION_COLOR),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget getAddFazarLayout(double parentHeight, double parentWidth) {
    return Padding(
        padding: EdgeInsets.only(top: parentHeight * 0.03),
        child: Container(
          height: parentHeight * 0.16,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5),
              ),
              BoxShadow(
                color: Colors.grey.shade50,
                offset: Offset(-5, 0),
              ),
              BoxShadow(
                color: Colors.grey.shade50,
                offset: Offset(5, 0),
              )
            ],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)),
                child: Container(
                  height: parentHeight * 0.04,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                        CommonColor.LEFT_COLOR,
                        CommonColor.RIGHT_COLOR
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "FAJR",
                        style: TextStyle(
                          fontSize:
                              SizeConfig.blockSizeHorizontal * 4.3,
                          fontFamily: 'Roboto_Bold',
                          fontWeight: FontWeight.w600,
                          color: CommonColor.WHITE_COLOR,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: parentWidth * 0.1,
                            top: parentHeight * 0.02),
                        child: Text("AZAN",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.blockSizeHorizontal *
                                      4.3,
                              fontFamily: 'Roboto_Bold',
                              fontWeight: FontWeight.w600,
                              color: CommonColor.BLACK_COLOR,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: parentWidth * 0.1,
                            top: parentHeight * 0.02),
                        child: Text("05:00",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.blockSizeHorizontal *
                                      4.3,
                              fontFamily: 'Roboto_Bold',
                              fontWeight: FontWeight.w600,
                              color: CommonColor.BLACK_COLOR,
                            )),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: parentHeight * 0.05,
                            top: parentHeight * 0.03),
                        child: Text("JAMA’AT",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.blockSizeHorizontal *
                                      4.3,
                              fontFamily: 'Roboto_Bold',
                              fontWeight: FontWeight.w600,
                              color: CommonColor.BLACK_COLOR,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: parentWidth * 0.1,
                            top: parentHeight * 0.02),
                        child: Text("05:30",
                            style: TextStyle(
                              fontSize:
                                  SizeConfig.blockSizeHorizontal *
                                      4.3,
                              fontFamily: 'Roboto_Bold',
                              fontWeight: FontWeight.w600,
                              color: CommonColor.BLACK_COLOR,
                            )),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
  Widget getAddzoharLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ZUHAR",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("AZAN",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("01:00",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("01:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getAddAsarLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ASR",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("AZAN",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("05:00",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("05:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getAddMagribLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MAGHRIB",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("AZAN",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("06:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("06:35",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getAddFazarSecoundLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "FAJR",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("AZAN",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("05:00",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("05:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getAddIshaLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ISHA",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("AZAN",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("08:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("08:45",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget getAddJumaLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * 0.03),
      child: Container(
        height: parentHeight * 0.16,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(-5, 0),
            ),
            BoxShadow(
              color: Colors.grey.shade50,
              offset: Offset(5, 0),
            )
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10)),
              child: Container(
                height: parentHeight * 0.04,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "JUMA",
                      style: TextStyle(
                        fontSize:
                        SizeConfig.blockSizeHorizontal * 4.3,
                        fontFamily: 'Roboto_Bold',
                        fontWeight: FontWeight.w600,
                        color: CommonColor.WHITE_COLOR,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("JAMA’AT 1",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("01:45",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: parentHeight * 0.05,
                          top: parentHeight * 0.03),
                      child: Text("JAMA’AT 2",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: parentWidth * 0.1,
                          top: parentHeight * 0.02),
                      child: Text("02:30",
                          style: TextStyle(
                            fontSize:
                            SizeConfig.blockSizeHorizontal *
                                4.3,
                            fontFamily: 'Roboto_Bold',
                            fontWeight: FontWeight.w600,
                            color: CommonColor.BLACK_COLOR,
                          )),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
