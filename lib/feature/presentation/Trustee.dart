import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/slider.dart';
import 'package:masjit_vendor_app/feature/presentation/truestee_register.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';

import 'eid_counting.dart';
import 'masjit_vendor_registration_from.dart';
import 'Notice.dart';
import 'package:masjit_vendor_app/feature/presentation/privacy_policy.dart';
import 'package:masjit_vendor_app/feature/presentation/sahr_iftar.dart';
import 'package:masjit_vendor_app/feature/presentation/terms_and_condition.dart';

class Trustee extends StatefulWidget {
  const Trustee({Key? key}) : super(key: key);

  @override
  _TrusteeState createState() => _TrusteeState();
}

class _TrusteeState extends State<Trustee> {
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
          padding: EdgeInsets.only(top:  SizeConfig.screenHeight*0.03),
          child: Center(
            child: Text("Trustee",style: TextStyle(
                fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                fontFamily: 'Roboto_Bold',
                letterSpacing: SizeConfig.screenWidth * 0.00,
                fontWeight: FontWeight.w400,
                color: CommonColor.WHITE_COLOR
            ),

            ),
          ),

        ),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const TrusteeRegister() ));
            },
            child: Padding(
              padding:  EdgeInsets.only(right: SizeConfig.screenWidth*0.01,top: SizeConfig.screenHeight*0.02),
              child: SizedBox(
                width: SizeConfig.screenWidth*.14,

                child: Image.asset(
                  'assets/images/appBarIcon.png',

                ),
              ),
            ),
          )],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
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
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => const Notice()));
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
                      Navigator.pop(
                         context);
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
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: parentHeight * 0.0),
          child: SizedBox(
            height: parentHeight,
            child: ListView.builder(
            itemCount: 4,
            padding: const EdgeInsets.only(
            bottom: 20,
              top: 5
            ),
            itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: parentHeight*0.03),
              child: Container(
                height: parentHeight * 0.12,
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
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10)),
                      child: Container(
                        height: parentHeight*0.06,
                        decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Chairman",
                            style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.9,
                                fontFamily: 'Roboto_Bold',
                                fontWeight: FontWeight.w500,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(left: parentWidth*0.1,top: parentHeight*0.02),
                              child: Text("Feroz",style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                fontFamily: 'Roboto_Bold',
                                fontWeight: FontWeight.w600,
                                color: CommonColor.BLACK_COLOR,)),
                            ),
                            Padding(
                              padding:EdgeInsets.only(right: parentWidth*0.1,top: parentHeight*0.02),
                              child: Text("9168682309",style: TextStyle(
              fontSize: SizeConfig.blockSizeHorizontal * 4.3,
              fontFamily: 'Roboto_Bold',
              fontWeight: FontWeight.w600,
              color: CommonColor.BLACK_COLOR,)),
                            ),
                          ],
                        ),


                      ],
                    )
                  ],
                ),
              ),
            );
            }),
          ),

          /* Container(
    height: parentHeight * 0.11,
      decoration: BoxDecoration(
        color: Colors.white,
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

    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: parentWidth * 0.03, top: parentHeight * 0.007),
              child: Text("Email Id"),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: parentWidth * 0.025, right: parentWidth * 0.025, top: parentHeight*0.007),
          child: Container(
            height: parentHeight*.06,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(5)
            ),
           child: Column(
             children: [
               Row(

               )
             ],
           ),
            ),
          ),

      ],
    ),
        )*/
        )
      ],
    );
  }
}
