import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/eid_timing.dart';
import 'package:masjit_vendor_app/feature/presentation/sahr_iftar.dart';
import 'package:masjit_vendor_app/feature/presentation/slider.dart';

import 'Notice.dart';
import 'Trustee.dart';
import 'eid_counting.dart';
import 'masjit_vendor_registration_from.dart';

import 'package:masjit_vendor_app/feature/presentation/Trustee.dart';
import 'package:masjit_vendor_app/feature/presentation/privacy_policy.dart';
import 'package:masjit_vendor_app/feature/presentation/sahr_iftar.dart';
import 'package:masjit_vendor_app/feature/presentation/terms_and_condition.dart';
import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';

class EidCounting extends StatefulWidget {
  const EidCounting({Key? key}) : super(key: key);

  @override
  _EidCountingState createState() => _EidCountingState();
}

class _EidCountingState extends State<EidCounting> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return Padding(
              padding:  EdgeInsets.only(top:SizeConfig.screenHeight*0.02 ),
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
        title:    Padding(
          padding: EdgeInsets.only(top:  SizeConfig.screenHeight*0.03,right: SizeConfig.screenHeight*0.05),
          child: Center(
            child: Text("EID",style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                fontFamily: 'Roboto_Bold',
                letterSpacing: SizeConfig.screenWidth * 0.00,
                fontWeight: FontWeight.w400,
                color: CommonColor.WHITE_COLOR
            ),

            ),
          ),

        ),
        /*actions: [
          Padding(
            padding:  EdgeInsets.only(right: SizeConfig.screenWidth*0.01,top: SizeConfig.screenHeight*0.02),
            child: Container(
              width: SizeConfig.screenWidth*.14,

              child: Image.asset(
                'assets/images/appBarIcon.png',

              ),
            ),
          )],*/
        flexibleSpace: Container(
          decoration:  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR]),
          ),

        ),


      ),
      body: Container(
          height: SizeConfig.screenHeight * 0.90,
          child:ListView(
              shrinkWrap: true,
              children: [
                getAddEidAlFiterLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                getAddEidAlAdhaLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
              ])

      ),
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ShareSendGalleryImage() ));

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
                      Navigator.pop(
                          context);
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
  Widget getAddEidAlFiterLayout(double parentHeight, double parentWidth) {
    return
            Padding(
              padding: EdgeInsets.only(top: parentHeight*0.03),
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
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade50,
                      offset: const Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade50,
                      offset: const Offset(5, 0),
                    )
                  ],
                ),
                child: Container(
                  height: parentHeight*0.9,
                  width: parentWidth*0.90,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        child: Container(
                          height: parentHeight*0.04,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(right: parentWidth*0.1),
                                  child: Container(
                                    child: Image(image: AssetImage("assets/images/appBarIcon.png"),color: Colors.transparent,),
                                  )),
                              Text("EID AL - FITR",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.WHITE_COLOR,

                                ),

                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EidTiming()));
                                },
                                child: Padding(
                                    padding:  EdgeInsets.only(right: parentWidth*0.05),
                                    child: Container(
                                      child: Image(image: AssetImage("assets/images/appBarIcon.png"),),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("1st Jamaat",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              ),
                              Padding(
                                padding:EdgeInsets.only(right: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("08:30",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: parentHeight*0.05,top: parentHeight*0.03),
                                child: Text("2nd Jamaat",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),

                              ),
                              Padding(
                                padding:EdgeInsets.only(right: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("09:30",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

    );
  }
  Widget getAddEidAlAdhaLayout(double parentHeight, double parentWidth) {
    return
            Padding(
              padding: EdgeInsets.only(top: parentHeight*0.03),
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
                      offset: const Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade50,
                      offset: const Offset(-5, 0),
                    ),
                    BoxShadow(
                      color: Colors.grey.shade50,
                      offset: const Offset(5, 0),
                    )
                  ],
                ),
                child: Container(
                  height: parentHeight*0.9,
                  width: parentWidth*0.90,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                        child: Container(
                          height: parentHeight*0.04,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(right: parentWidth*0.1),
                                  child: Container(
                                    child: Image(image: AssetImage("assets/images/appBarIcon.png"),color: Colors.transparent,),
                                  )),
                              Text("EID AL - ADHA",
                                style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.WHITE_COLOR,

                                ),

                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EidTiming()));
                                },
                                child: Padding(
                                    padding:  EdgeInsets.only(right: parentWidth*0.05),
                                    child: Container(
                                      child: Image(image: AssetImage("assets/images/appBarIcon.png"),),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),

                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("1st Jamaat",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              ),
                              Padding(
                                padding:EdgeInsets.only(right: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("07:30",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:  EdgeInsets.only(left: parentHeight*0.05,top: parentHeight*0.03),
                                child: Text("2nd Jamaat",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),

                              ),
                              Padding(
                                padding:EdgeInsets.only(right: parentWidth*0.1,top: parentHeight*0.02),
                                child: Text("08:30",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.BLACK_COLOR,)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),

    );
  }
}
