import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/slider.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';
import 'eid_counting.dart';

class registration extends StatefulWidget {
  const registration({Key? key}) : super(key: key);

  @override
  _registrationState createState() => _registrationState();
}

String dropdownvalue = 'Area';
var items = ['Apple', 'Banana', 'Grapes', 'Orange', 'watermelon', 'Pineapple'];
String dropdownvalueCity = 'City';
var itemsCity = [
  'Apple',
  'Banana',
  'Grapes',
  'Orange',
  'watermelon',
  'Pineapple'
];
String? theArea;
String? theCity;

class _registrationState extends State<registration> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenHeight * 0.1,
                decoration: const BoxDecoration(
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
                child: MainHeading(
                    SizeConfig.screenHeight, SizeConfig.screenWidth),
              ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.9,
                child: ListView(
                  children: [
                    RegistartionContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    PsswordContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                   PhoneNumberContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),

                    MasjitNameContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ImamNameContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ImamNumberContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    AddressContant(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                    AreaContant(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    StateCountry(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    UploadImageText(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    UploadImageWithIcon(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ContinueButton(SizeConfig.screenHeight, SizeConfig.screenWidth),
                   BlankContainer(SizeConfig.screenHeight, SizeConfig.screenWidth)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget MainHeading(double parentHeight, double parentWidth) {
    return Container(
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
                  padding: EdgeInsets.only(top: parentHeight * 0.04),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: parentHeight * .03,
                    color: CommonColor.WHITE_COLOR,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: parentHeight * 0.04),
            child: Text(
              "Registration",
              style: TextStyle(
                  fontSize: SizeConfig.blockSizeHorizontal * 5.0,
                  fontFamily: 'Roboto_Medium',
                  letterSpacing: parentWidth * 0.003,
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
                  child: const Text("Email Id"),
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
                      hintText: "Email Id",
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

  Widget PsswordContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02,top: parentHeight *0.02),
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
                  child: const Text("Password"),
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
                      hintText: "Password",
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
                  child: Text("Phone No",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockSizeHorizontal * 3.5,

                    ),),
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
                      color: CommonColor.REGISTRARTION_COLOR, width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.red,
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth * 0.03),
                          child: const Text("+91"),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: parentWidth * 0.05),
                      child: Container(
                        color: CommonColor.REGISTRARTION_COLOR,
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

  Widget MasjitNameContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02,top: parentHeight*0.02),
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
                  child: const Text("Masjit Name"),
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
                      hintText: "Masjit Name",
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
  Widget ImamNameContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02,top: parentHeight*0.02),
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
                  child: const Text("Imam Name"),
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
                      hintText: "Imam Name",
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
  Widget ImamNumberContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02,top: parentHeight*0.02),
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
                  child: const Text("Imam Number"),
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
                      hintText: "Imam Number",
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
  Widget AddressContant(double parentHeight, double parentWidth) {
    return Padding(
      padding:
      EdgeInsets.only(left: parentWidth * 0.02, right: parentWidth * 0.02,top: parentHeight*0.02),
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
                  child: const Text("Address"),
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
                      hintText: "Address",
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


  Widget AreaContant(double parentHeight, double parentWidth) {
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.03, top: parentHeight * 0.009),
                    child: const Text("Area"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.009, left: parentWidth * 0.025,
                      right: parentWidth * 0.025,),
                    child: Container(
                      height: parentHeight * .07,
                      width: parentWidth*0.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: theArea,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: <String>[
                            'pune',
                            'mumbai',
                            'Aurangabad',
                            'Solapur',
                            'Nashik'
                          ]
                              .map((String val) => DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          ))
                              .toList(),
                          hint: Padding(
                            padding: EdgeInsets.only(left: parentWidth * 0.03),
                            child: Text(
                              'Area',
                              style: TextStyle(
                                fontFamily: "Roboto_Regular",
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              ),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              theArea = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.03,
                        top: parentHeight * 0.009),
                    child: const Text("City"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.025,
                        right: parentWidth * 0.025,
                        top: parentHeight * 0.009),
                    child: Container(
                      height: parentHeight * .07,
                      width: parentWidth*0.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: parentWidth * 0.01,
                            right: parentWidth * 0.01),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: theCity,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              'pune',
                              'mumbai',
                              'Aurangabad',
                              'Solapur',
                              'Nashik'
                            ]
                                .map((String val) => DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            ))
                                .toList(),
                            hint: Padding(
                                padding: EdgeInsets.only(left: parentWidth * 0.03),
                                child: Text('City',
                                  style: TextStyle(
                                    fontFamily: "Roboto_Regular",
                                    fontSize: SizeConfig.blockSizeHorizontal * 4.0,),)
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                theCity = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget StateCountry(double parentHeight, double parentWidth) {
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.03, top: parentHeight * 0.009),
                    child: const Text("State"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.009, left: parentWidth * 0.025,
                      right: parentWidth * 0.025,),
                    child: Container(
                      height: parentHeight * .07,
                      width: parentWidth*0.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: theArea,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: <String>[
                            'pune',
                            'mumbai',
                            'Aurangabad',
                            'Solapur',
                            'Nashik'
                          ]
                              .map((String val) => DropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          ))
                              .toList(),
                          hint: Padding(
                            padding: EdgeInsets.only(left: parentWidth * 0.03),
                            child: Text(
                              'State',
                              style: TextStyle(
                                fontFamily: "Roboto_Regular",
                                fontSize: SizeConfig.blockSizeHorizontal * 4.0,
                              ),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              theArea = value!;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.03,
                        top: parentHeight * 0.009),
                    child: const Text("Country"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: parentWidth * 0.025,
                        right: parentWidth * 0.025,
                        top: parentHeight * 0.009),
                    child: Container(
                      height: parentHeight * .07,
                      width: parentWidth*0.5,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: parentWidth * 0.01,
                            right: parentWidth * 0.01),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            value: theCity,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: <String>[
                              'pune',
                              'mumbai',
                              'Aurangabad',
                              'Solapur',
                              'Nashik'
                            ]
                                .map((String val) => DropdownMenuItem<String>(
                              value: val,
                              child: Text(val),
                            ))
                                .toList(),
                            hint: Padding(
                                padding: EdgeInsets.only(left: parentWidth * 0.03),
                                child: Text('Country',
                                  style: TextStyle(
                                    fontFamily: "Roboto_Regular",
                                    fontSize: SizeConfig.blockSizeHorizontal * 4.0,),)
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                theCity = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget UploadImageText(double parentHeight,double parentWidth){
    return Container(
      child: Padding(
        padding:  EdgeInsets.only(top: parentHeight*0.05),
        child: Text("Upload Masjid Image",

          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.blockSizeHorizontal * 4.3,
            fontFamily: "Roboto_Regular",
            color: CommonColor.REGISTRARTION_COLOR,
          ),
          textAlign: TextAlign.center,
        ),
      ),);

  }

  Widget UploadImageWithIcon(double parentHeight,double parentWidth){
    return Padding(
      padding:  EdgeInsets.only(top: parentHeight*0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:EdgeInsets.only(left: parentWidth*0.1),
            child: Container(
                height: parentHeight*0.10,
                width: parentWidth*0.19,

                decoration: BoxDecoration(

                    image: const DecorationImage(
                      image:  AssetImage("assets/images/logo.png"),
                      fit: BoxFit.cover,

                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          Container(
              height: parentHeight*0.10,
              width: parentWidth*0.19,

              decoration: BoxDecoration(

                  image: const DecorationImage(
                    image:  AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,

                  ),
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          Container(
              height: parentHeight*0.10,
              width: parentWidth*0.19,

              decoration: BoxDecoration(

                  image: const DecorationImage(
                    image:  AssetImage("assets/images/logo.png"),
                    fit: BoxFit.cover,

                  ),
                  borderRadius: BorderRadius.circular(10)
              )
          ),
          Padding(
              padding:  EdgeInsets.only(right: parentWidth*0.1),
              child: Container(
                child: const Image(image: AssetImage("assets/images/plusicon.png"),),
              ))
        ],




      ),
    );
  }

  Widget ContinueButton(double parentHeight,double parentWidth){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShareSendGalleryImage()));
      },
      child: Padding(
        padding:  EdgeInsets.only(top: parentHeight*0.09,left: parentWidth*0.1,right: parentWidth*0.1),
        child: Container(
            height: parentHeight*0.06,


            decoration:  BoxDecoration(
              gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [CommonColor.LEFT_COLOR, CommonColor.RIGHT_COLOR]),
              borderRadius: BorderRadius.circular(30),


            ),
            child:Center(
              child: Text("Continue",style: TextStyle(
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
  Widget BlankContainer(double parentHeight,double parentWidth){
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EidCounting()));
      },
      child: Padding(
        padding:  EdgeInsets.only(top: parentHeight*0.09,left: parentWidth*0.1,right: parentWidth*0.1),
        child: Container(
            height: parentHeight*0.06,



        ),
      ),
    );
  }

}
