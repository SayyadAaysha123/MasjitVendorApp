import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/sahr_iftar.dart';
import 'package:masjit_vendor_app/feature/presentation/slider.dart';
import 'package:masjit_vendor_app/feature/presentation/weekly_namaz_timing.dart';
import 'eid_counting.dart';
import 'masjit_vendor_registration_from.dart';
import 'Trustee.dart';
import 'package:masjit_vendor_app/feature/presentation/Trustee.dart';
import 'package:masjit_vendor_app/feature/presentation/privacy_policy.dart';
import 'package:masjit_vendor_app/feature/presentation/terms_and_condition.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';
class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
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
            child: Text("Notice",style: TextStyle(
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
          decoration:  const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR]),
          ),

        ),


      ),
      body: SizedBox(
          height: SizeConfig.screenHeight * 0.90,
          child: getAddEmailLayout(
              SizeConfig.screenHeight, SizeConfig.screenWidth)),
      drawer: Padding(
        padding: EdgeInsets.only(top:SizeConfig.screenHeight*0.06),
        child: SizedBox(
          height: SizeConfig.screenHeight * .98,
          width: SizeConfig.screenHeight * .4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30.0),
            ),
            child: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  const SizedBox(
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

                      Navigator.push(context,MaterialPageRoute(builder: (context) => const ShareSendGalleryImage() ));

                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShareSendGalleryImage(),
                        ),
                      );*/
                    },

                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const SahrIftar() ));
                    },
                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                          context, MaterialPageRoute(builder: (context) => const EidCounting()));
                    },
                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                      Navigator.pop(
                          context, );
                    },


                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                  const ListTile(
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
                          context, MaterialPageRoute(builder: (context) => const Trustee()));
                    },

                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                          context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
                    },

                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                          context, MaterialPageRoute(builder: (context) => const TermsAndCondition()));
                    },

                    // leading: Icon(Icons.message),
                    title: const Padding(
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
                          context, MaterialPageRoute(builder: (context) => const registration()));
                    },

                    // leading: Icon(Icons.message),
                    title: const Padding(
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
  Widget getAddEmailLayout(double parentHeight, double parentWidth) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const WeeklyNamazTiming()));

          },
          onDoubleTap: () {},
          child: Padding(
            padding: EdgeInsets.only(top: parentHeight*0.03,left: parentWidth*0.03,right: parentWidth*0.03),
            child: Container(
              height: parentHeight * 0.25,
             width: parentHeight * 0.50,
              decoration: BoxDecoration(
                color: CommonColor.NOTICE_TEXT,
                borderRadius: BorderRadius.circular(10),
    border: Border.all(color: CommonColor.GRAY_COLOR.withOpacity(0.15), width: 2),

              ),

               /* child:Padding(
                  padding:  EdgeInsets.only(left: parentWidth*0.05,top:parentHeight*0.02),
                  child: Text("Write Notice Here....",style: TextStyle(
                      fontFamily: "Roboto_Regular",
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                      color: CommonColor.FRAME_NAME
                  ),),
                )*/

              child: TextFormField(
                autocorrect: true,
                textInputAction: TextInputAction.next,
               // keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Write Notice Here....",
                  contentPadding: EdgeInsets.only(
                      left: parentWidth * 0.03,
                      ),
                  hintStyle: TextStyle(
                    fontFamily: "Roboto_Regular",
                    fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                     color: CommonColor.FRAME_NAME,

                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                maxLines: null,
                textAlign: TextAlign.start,
                //overflow: TextOverflow.ellipsis,
                //textScaleFactor: 1.0,
                // controller: emailController,
                style: TextStyle(
                  fontFamily: "Roboto_Regular",
                  fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                  // color: CommonColor.WHITE_COLOR,
                ),
              ),



             /* child: Container(
                height: parentHeight*0.9,
                width: parentWidth*0.90,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      child: Container(
                        height: parentHeight*0.04,

                      ),*/




                ),
              )
                  )


      ],
    );
  }
}