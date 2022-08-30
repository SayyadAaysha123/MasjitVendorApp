import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:masjit_vendor_app/feature/presentation/weekly_namaz_timing.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';
class WeeklyNamaz extends StatefulWidget {
  const WeeklyNamaz({Key? key}) : super(key: key);

  @override
  State<WeeklyNamaz> createState() => _WeeklyNamazState();
}

class _WeeklyNamazState extends State<WeeklyNamaz> {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
        body: Column(
          children: [

            Container(
              height: SizeConfig.screenHeight * .1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [CommonColor.GET_STARTED_LEFT_COLOR, CommonColor.GET_STARTED_RIGHT_COLOR]),


              ),
              child: getRegistartionNameLayout(
                  SizeConfig.screenHeight, SizeConfig.screenWidth),
            ),

            Container(
                height: SizeConfig.screenHeight*0.90,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                   getEmailLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                   getEmailLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                   getEmailLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                   /* getPasswordLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),

                    getPhoneNumberLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getMsjitNameLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getImamNameLayout(SizeConfig.screenHeight, SizeConfig.screenWidth), getImamNumberLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getAddressLayout(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getBottomButton(SizeConfig.screenHeight, SizeConfig.screenWidth),
                    getCountryCodeAndTextField(SizeConfig.screenHeight, SizeConfig.screenWidth),
*/

                  ],
                )
            )
          ],
        ));


  }


  Widget getRegistartionNameLayout(double parentHeight, double parentWidth) {
    return Padding(
      padding: EdgeInsets.only(
          left: parentWidth * .05,
          right: parentWidth * .05,
          top: parentHeight * .04),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                /*  if (widget.mListener != null)
                  widget.mListener
                      .backToGeneralFragment(Constant.GENERAL_SETTING);*/
              },
              onDoubleTap: () {},
              child: Container(
                  padding: EdgeInsets.all(2.0),
                  color: Colors.transparent,
                  child: new Icon(
                    Icons.arrow_back_ios,
                    color: CommonColor.WHITE_COLOR,
                    size: parentHeight * .03,
                  ))),
          new Text(
            "Weekly Namaz",
            // StringEn.GENERAL_LANGUAGE,
            //  ApplicationLocalizations.of(context)!.translate("language")!,
            style: TextStyle(
              fontSize: SizeConfig.safeBlockHorizontal * 5.0,
              color: CommonColor.WHITE_COLOR,
              fontWeight: FontWeight.w400,
              fontFamily: "Roboto_Medium",
            ),
            textScaleFactor: 1.0,
          ),
          GestureDetector(


    onTap: () {
    Navigator.push(context,

    MaterialPageRoute(builder: (context) => WeeklyNamazTiming()));
    },
    onDoubleTap: () {},
            child: Container(
                padding: EdgeInsets.all(2.0),
                color: Colors.transparent,
                child: new Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.transparent,
                  size: parentHeight * .03,
                )),
          )
        ],
      ),
    );
  }
  Widget getEmailLayout(double parentHeight, double parentWidth) {
    return Stack(
      children: [
        Padding(
          padding:EdgeInsets.only(left: parentWidth*0.02),
          child: Container(

            height: parentHeight * 0.12,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [CommonColor.GET_STARTED_LEFT_COLOR, CommonColor.GET_STARTED_RIGHT_COLOR]),


              borderRadius: BorderRadius.all(Radius.circular(20)),

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




            child: Padding(
              padding: EdgeInsets.only(
                  top: parentHeight * 0.008,
                  left: parentWidth * 0.05,
                  right: parentWidth * 0.05),
              child: Container(
                height: parentHeight * 0.12,
                decoration: BoxDecoration(


                  borderRadius: BorderRadius.all(Radius.circular(20)),

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
                            left: parentWidth * 0.03, top: parentHeight * 0.02,),
                          child: Text("FAJR", style: TextStyle(
                              fontSize: SizeConfig.blockSizeHorizontal * 3.9,
                              color: CommonColor.FRAME_NAME,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto_Regular")),
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
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: parentWidth * 0.01, right: parentWidth * 0.01),
                          child: TextFormField(
                            autocorrect: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "FAJR",
                              contentPadding: EdgeInsets.only(left: parentWidth * 0.03, bottom: parentHeight*0.016),
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
            ),
          ),
        ),
      ],
    );
  }

}
