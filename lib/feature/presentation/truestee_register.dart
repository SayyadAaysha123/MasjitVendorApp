import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/Notice.dart';
import 'package:masjit_vendor_app/feature/presentation/privacy_policy.dart';
import 'package:masjit_vendor_app/feature/presentation/weekly_namaz_timing.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';
import 'Trustee.dart';
import 'eid_counting.dart';


class TrusteeRegister extends StatefulWidget {
  const TrusteeRegister({Key? key}) : super(key: key);

  @override
  _TrusteeRegisterState createState() => _TrusteeRegisterState();
}

class _TrusteeRegisterState extends State<TrusteeRegister> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.12,
                decoration:  BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          CommonColor.LEFT_COLOR,
                          CommonColor.RIGHT_COLOR
                        ]),
                    border: Border(
                        bottom: BorderSide(
                            width: 1, color: CommonColor.RIGHT_COLOR))),
                child: getAddMainHeadingLayout(
                    SizeConfig.screenHeight, SizeConfig.screenWidth),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.88,
                child: ListView(
                  children: [
                    RegistartionContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    PhoneNumberContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    Desgnation(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    SaveButton(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget getAddMainHeadingLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(top: parentHeight * .0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            onDoubleTap: () {},
            child: Padding(
              padding: EdgeInsets.only(left: parentWidth * .04),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: parentHeight * 0.07),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: parentHeight * .025,
                    color: CommonColor.WHITE_COLOR,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight * 0.07),
            child: Text(
              "Trustee",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                  fontFamily: 'Roboto_Medium',

                  fontWeight: FontWeight.w400,
                  color: CommonColor.WHITE_COLOR),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: parentWidth * .04),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: parentHeight * .03,
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget RegistartionContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
          EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02),
      child: Container(
        height: parentHeight * 0.12,
        width: parentHeight * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth * 0.03, top: parentHeight * 0.009),
                  child: Text("Name",style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Medium',

                      fontWeight: FontWeight.w600,
                      color: CommonColor.REGISTRARTION_TRUSTEE
                  ),),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: parentWidth * 0.025,
                  right: parentWidth * 0.025,
                  top: parentHeight * 0.009),
              child: Container(
                height: parentHeight * .07,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth * 0.01, right: parentWidth * 0.01),
                  child: TextFormField(
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Name",
                      contentPadding: EdgeInsets.only(
                          left: parentWidth * 0.03,
                          bottom: parentHeight * 0.0),
                      hintStyle: TextStyle(
                        fontFamily: "Roboto_Regular",
                        fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                        // color: CommonColor.DIVIDER_COLOR,
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
                    // controller: emailController,
                    style: TextStyle(
                      fontFamily: "Roboto_Regular",
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      // color: CommonColor.WHITE_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget PhoneNumberContant(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          top: parentHeight * 0.02,
          left: parentWidth * 0.02,
          right: parentWidth * 0.02),
      child: Container(
        height: parentHeight * 0.12,
        width: parentHeight * 0.9,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 3),
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
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth * 0.03, top: parentHeight * 0.009),
                  child: Text(
                    "Phone No",

                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                          fontFamily: 'Roboto_Medium',

                          fontWeight: FontWeight.w600,
                          color: CommonColor.REGISTRARTION_TRUSTEE


                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: parentWidth * 0.017,
                  right: parentWidth * 0.017,
                  top: parentHeight * 0.009),
              child: Container(
                height: parentHeight * .07,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.green, width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.red,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth * 0.03),
                          child: Text("+91",style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              fontFamily: 'Roboto_Medium',

                              fontWeight: FontWeight.w600,
                              color: CommonColor.REGISTRARTION_TRUSTEE
                          ),),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth * 0.05),
                      child: Container(
                        color: Colors.green,
                        height: parentHeight * 0.07,
                        width: parentWidth * 0.004,
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: parentWidth * 0.01,
                            right: parentWidth * 0.01),
                        child: TextFormField(
                          autocorrect: true,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,

                          decoration: InputDecoration(
                            hintText: "Mobile Number",
                            contentPadding: EdgeInsets.only(
                                left: parentWidth * 0.03,
                                bottom: parentHeight * 0.0),
                            hintStyle: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              // color: CommonColor.DIVIDER_COLOR,
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
                          // controller: emailController,
                          style: TextStyle(
                            fontFamily: "Roboto_Regular",
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            // color: CommonColor.WHITE_COLOR,
                          ),
                        ),
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
  Widget Desgnation(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02, top: parentHeight * 0.02,),
      child: Container(
        height: parentHeight * 0.12,
        width: parentHeight * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3),
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth * 0.03, top: parentHeight * 0.009),
                  child: Text("Desgnation",style: TextStyle(
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      fontFamily: 'Roboto_Medium',

                      fontWeight: FontWeight.w600,
                      color: CommonColor.REGISTRARTION_TRUSTEE
                  ),),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: parentWidth * 0.025,
                  right: parentWidth * 0.025,
                  top: parentHeight * 0.009),
              child: Container(
                height: parentHeight * .07,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 1.5),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: parentWidth * 0.01, right: parentWidth * 0.01),
                  child: TextFormField(
                    autocorrect: true,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Desgnation",
                      contentPadding: EdgeInsets.only(
                          left: parentWidth * 0.03,
                          bottom: parentHeight * 0.0),
                      hintStyle: TextStyle(
                        fontFamily: "Roboto_Regular",
                        fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                        // color: CommonColor.DIVIDER_COLOR,
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
                    // controller: emailController,
                    style: TextStyle(
                      fontFamily: "Roboto_Regular",
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                      // color: CommonColor.WHITE_COLOR,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SaveButton(double parentHeight,double parentWidth){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Trustee()));
      },
      child: Padding(
        padding:  EdgeInsets.only(top: parentHeight*0.05,left: parentWidth*0.1,right: parentWidth*0.1),
        child: Container(
height: parentHeight*0.06,


          decoration:  BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR]),
            borderRadius: BorderRadius.circular(30),


          ),
            child:Center(
              child: Text("Save",style: TextStyle(
                fontFamily: "Roboto_Regular",
                fontWeight: FontWeight.w700,
                fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                color: CommonColor.WHITE_COLOR
              ),),
            )
        ),
      ),
    );
  }
}
