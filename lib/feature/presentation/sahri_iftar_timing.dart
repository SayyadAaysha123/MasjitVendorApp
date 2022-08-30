

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../../localclass/masjit_vendor_colors.dart';
import '../../localclass/masjit_vendor_size_config.dart';



class ShariIftarTiming extends StatefulWidget {
  const ShariIftarTiming({Key? key}) : super(key: key);

  @override
  State<ShariIftarTiming> createState() => _ShariIftarTimingState();
}

class _ShariIftarTimingState extends State<ShariIftarTiming> with SingleTickerProviderStateMixin  {
  DateTime _dateTime = DateTime.now();

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }


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
                  child:Column(
                    children: [getAddtimePiker(
                        SizeConfig.screenHeight, SizeConfig.screenWidth),
                      getTodayDate(
                          SizeConfig.screenHeight, SizeConfig.screenWidth),
                    ],


                  ))
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
              "SAHR / IFTAR",
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

  Widget getAddtimePiker(double parentHeight, double parentWidth){
    return Container(
      padding: EdgeInsets.only(
          top: parentHeight*0.08
      ),
      child: new Column(
        children: <Widget>[
           hourMinute12H(),
          //hourMinute15Interval(),
            //hourMinuteSecond(),
            //hourMinute12HCustomStyle(),
          new Container(
            margin: EdgeInsets.symmetric(
                vertical: 28
            ),
            /* child: new Text(
              _dateTime.hour.toString().padLeft(2, '0') + ':' +
                  _dateTime.minute.toString().padLeft(2, '0') + ':' +
                  _dateTime.second.toString().padLeft(2, '0'),
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
            ),*/
          ),
        ],
      ),
    );
  }
  Widget hourMinute12H(){
    return new TimePickerSpinner(
      highlightedTextStyle: TextStyle(fontSize: 30, color: CommonColor.FRAME_NAME,fontWeight: FontWeight.w700,fontFamily: "Roboto_Bold", ),
normalTextStyle:  TextStyle(fontSize: 30, color: Colors.grey,fontWeight: FontWeight.w700,fontFamily: "Roboto_Bold",),
      is24HourMode: false,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
  /*Widget hourMinuteSecond(){
    return new TimePickerSpinner(
      isShowSeconds: true,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }*/
  /*Widget hourMinute15Interval(){
    return new TimePickerSpinner(
      spacing: 40,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }*/
 /* Widget hourMinute12HCustomStyle(){
    return new TimePickerSpinner(
      is24HourMode: false,
      normalTextStyle: TextStyle(
          fontSize: 24,
          color:CommonColor.REGISTRARTION_COLOR
      ),
      highlightedTextStyle: TextStyle(
          fontSize: 24,
          color: Colors.yellow
      ),
      spacing: 50,
      itemHeight: 80,
      isForce2Digits: true,
      minutesInterval: 15,
      onTimeChange: (time) {
        setState(() {
          _dateTime = time;
        });
      },
    );
  }
*/
 /* Widget getTodayDate(double parentHeight,double parentWidth){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding:EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.001),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10.0),),
            child: Container(
              height: parentHeight * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [CommonColor.REGISTRARTION_COLOR, CommonColor.REGISTRARTION_COLOR]),
              ),

 child: Column(
   children: [

     Row(
       children: [
         Padding(
           padding:  EdgeInsets.only(left: parentWidth*0.04,top: parentWidth*0.03),
           child: Text("Todays Date",style: TextStyle(
               fontFamily: "Roboto_Regular",
               fontWeight: FontWeight.w500,
               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
               color: CommonColor.WHITE_COLOR
           ),),
         ),
       ],
     ),

     Expanded(
       child: DefaultTabController(

         length: 6,
         child: Column(

           children: <Widget>[
             Container(
               constraints: BoxConstraints.expand(height: 30,width: parentWidth),
               child: TabBar(
                   indicatorColor: Colors.transparent,
                   labelColor: Colors.white,
                   unselectedLabelColor: Colors.grey,
                   tabs: [
                 Padding(
                   padding: EdgeInsets.only(left: parentWidth*0.03,top: parentHeight*0.02),

                   child: Tab(
                     child: Container(
                       child:Text("ZUHAR",style: TextStyle(
    fontFamily: "Roboto_Regular",
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.blockSizeHorizontal * 3.5,
   // color: CommonColor.WHITE_COLOR
    ),),
                     ),
                    ),
                 ),
                     Padding(
                       padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),

                       child: Tab(
                         child: Container(
                           child:Text("ZUHAR",style: TextStyle(
                               fontFamily: "Roboto_Regular",
                               fontWeight: FontWeight.w500,
                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,

                           ),),
                         ),
                       ),
                     ),




                     Padding(
                       padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),

                       child: Tab(
                         child: Container(
                           child:Text("ZUHAR",style: TextStyle(
                               fontFamily: "Roboto_Regular",
                               fontWeight: FontWeight.w500,
                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              // color: CommonColor.WHITE_COLOR
                           ),),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),

                       child: Tab(
                         child: Container(
                           child:Text("ZUHAR",style: TextStyle(
                               fontFamily: "Roboto_Regular",
                               fontWeight: FontWeight.w500,
                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                               //color: CommonColor.WHITE_COLOR
                           ),),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),

                       child: Tab(
                         child: Container(
                           child:Text("ZUHAR",style: TextStyle(
                               fontFamily: "Roboto_Regular",
                               fontWeight: FontWeight.w500,
                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              // color: CommonColor.WHITE_COLOR
                           ),),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(right: parentWidth*0.03,top: parentHeight*0.02),

                       child: Tab(
                         child: Container(
                           child:Text("ZUHAR",style: TextStyle(
                               fontFamily: "Roboto_Regular",
                               fontWeight: FontWeight.w500,
                               fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                               //color: CommonColor.WHITE_COLOR
                           ),),
                         ),
                       ),
                     ),
               ]),
             ),
             Expanded(
               child: Container(
                 child: TabBarView(children: [
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                               style: TextStyle(
                                 color: Colors.transparent
                               ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                   Column(
                     children: [
                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.05),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("AZAN",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.013),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Padding(

                               padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                               child: Text("JAMA’AT",style: TextStyle(
                                 fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                 fontFamily: 'Roboto_Bold',
                                 fontWeight: FontWeight.w600,
                                 color: CommonColor.WHITE_COLOR,)),
                             ),

                             Row(
                               children: [
                                 Padding(
                                   padding:EdgeInsets.only(right: parentWidth*0.06,top: parentHeight*0.03),
                                   child: Text("05:00",style: TextStyle(
                                     fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                     fontFamily: 'Roboto_Bold',
                                     fontWeight: FontWeight.w600,
                                     color: CommonColor.WHITE_COLOR,)),
                                 ),
                                 Padding(
                                   padding:  EdgeInsets.only(top: parentHeight*0.03,right: parentWidth*0.03),
                                   child:
                                   Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                 // Icon(Icons.edit),
                               ],
                             )
                           ],
                         ),

                       ),

                       Padding(
                         padding: EdgeInsets.only(top: parentHeight*0.03),
                         child: Row(
                           children: [
                             Container(
                               color:CommonColor.BLACK,
                               height: parentHeight*0.001,
                               width: parentWidth,
                               child:Text("hi",
                                 style: TextStyle(
                                     color: Colors.transparent
                                 ),),
                             ),
                           ],
                         ),
                       ),

                     ],
                   ),
                 ]),
               ),
             )
           ],
         ),
       ),
     ),
   ],
 ),
          ),),
        ),
          // tab bar view here



 *//*   child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: parentWidth*0.04,top: parentWidth*0.03),
                          child: Text("Todays Date",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.09,top: parentHeight*0.02),
                          child: Text("FAJR",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),
                          child: Text("ZUHAR",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),
                          child: Text("ASR",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.02),
                          child: Text("MAGHRIB",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.0,top: parentHeight*0.02),
                          child: Text("ISHA",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: parentWidth*0.07,top: parentHeight*0.02),
                          child: Text("JUMA",style: TextStyle(
                              fontFamily: "Roboto_Regular",
                              fontWeight: FontWeight.w500,
                              fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                              color: CommonColor.WHITE_COLOR
                          ),),
                        ),

                      ],
                    ),

                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.007),
                          child: Row(
                            children: [
                              Padding(

                                padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.1),
                                child: Text("AZAN",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.WHITE_COLOR,)),
                              ),

                              Row(
                                children: [
        Text("hii"),
                                  Padding(
                                    padding:EdgeInsets.only(left: parentWidth*0.6,top: parentHeight*0.1),
                                    child: Text("05:00",style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                      fontFamily: 'Roboto_Bold',
                                      fontWeight: FontWeight.w600,
                                      color: CommonColor.WHITE_COLOR,)),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: parentHeight*0.1,left: parentWidth*0.03),
                                    child:
                                    Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                  // Icon(Icons.edit),
                                ],
                              )
                            ],
                          ),

                        ),
                        Padding(
                          padding: EdgeInsets.only(top: parentHeight*0.00),
                          child: Row(
                            children: [
                              Padding(

                                padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                                child: Text("AZAN",style: TextStyle(
                                  fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                  fontFamily: 'Roboto_Bold',
                                  fontWeight: FontWeight.w600,
                                  color: CommonColor.WHITE_COLOR,)),
                              ),

                              Row(
                                children: [
                                 Text("hii"),
                                  Padding(
                                    padding:EdgeInsets.only(left: parentWidth*0.6,top: parentHeight*0.03),
                                    child: Text("05:00",style: TextStyle(
                                      fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                      fontFamily: 'Roboto_Bold',
                                      fontWeight: FontWeight.w600,
                                      color: CommonColor.WHITE_COLOR,)),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.only(top: parentHeight*0.03,left: parentWidth*0.03),
                                    child:
                                    Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                  // Icon(Icons.edit),
                                ],
                              )
                            ],
                          ),

                        ),
                      ],
                    ),
                  ],
                ),*//*


        Padding(
          padding: EdgeInsets.only(
              top: parentHeight * 0.00,
              left: parentWidth * 0.0,
              right: parentWidth * 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10.0),),
            child: Container(
              height: parentHeight*0.1,
              decoration: BoxDecoration(
                  color: CommonColor.WHITE_COLOR
              ),


              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
    onTap: () {
    Navigator.pop(context);
    *//*  if (widget.mListener != null)
                  widget.mListener
                      .backToGeneralFragment(Constant.GENERAL_SETTING);*//*
    },
    onDoubleTap: () {},


                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight * 0.0, left: parentWidth * 0.15,
                        right: parentWidth * 0.028,),                              child: Container(
                        height: parentHeight * .06,
                        width: parentWidth*0.3,


                        decoration:  BoxDecoration(
                          color: CommonColor.SAVE_BUTTON,
                          borderRadius: BorderRadius.circular(10),


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
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.0, left: parentWidth * 0.025,
                      right: parentWidth * 0.15,),                              child: Container(
                      height: parentHeight * .06,
                      width: parentWidth*0.3,


                      decoration:  BoxDecoration(
                        color: CommonColor.CANCLE_BUTTON,
                        borderRadius: BorderRadius.circular(10),


                      ),
                      child:Center(
                        child: Text("Cancle",style: TextStyle(
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w700,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                            color: CommonColor.WHITE_COLOR
                        ),),
                      )
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }*/

  Widget getTodayDate(double parentHeight,double parentWidth){
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding:EdgeInsets.only(left: parentWidth*0.0,top: parentHeight*0.05),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10.0),),
            child: Container(
              height: parentHeight * 0.40,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [CommonColor.REGISTRARTION_COLOR, CommonColor.REGISTRARTION_COLOR]),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: parentWidth*0.04,top: parentWidth*0.03),
                        child: Text("Todays Date",style: TextStyle(
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w500,
                            fontSize: SizeConfig.blockSizeHorizontal * 3.5,
                            color: CommonColor.WHITE_COLOR
                        ),),
                      ),
                    ],
                  ),


                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: parentHeight*0.007),
                        child: Row(
                          children: [
                            Padding(

                              padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.1),
                              child: Text("AZAN",style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                fontFamily: 'Roboto_Bold',
                                fontWeight: FontWeight.w600,
                                color: CommonColor.WHITE_COLOR,)),
                            ),

                            Row(
                              children: [
                                /*Text("hii"),*/
                                Padding(
                                  padding:EdgeInsets.only(left: parentWidth*0.6,top: parentHeight*0.1),
                                  child: Text("05:00",style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                    fontFamily: 'Roboto_Bold',
                                    fontWeight: FontWeight.w600,
                                    color: CommonColor.WHITE_COLOR,)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: parentHeight*0.1,left: parentWidth*0.03),
                                  child:
                                  Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                // Icon(Icons.edit),
                              ],
                            )
                          ],
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(top: parentHeight*0.00),
                        child: Row(
                          children: [
                            Padding(

                              padding:  EdgeInsets.only(left: parentWidth*0.07,top: parentHeight*0.03),
                              child: Text("AZAN",style: TextStyle(
                                fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                fontFamily: 'Roboto_Bold',
                                fontWeight: FontWeight.w600,
                                color: CommonColor.WHITE_COLOR,)),
                            ),

                            Row(
                              children: [
                                /*Text("hii"),*/
                                Padding(
                                  padding:EdgeInsets.only(left: parentWidth*0.6,top: parentHeight*0.03),
                                  child: Text("05:00",style: TextStyle(
                                    fontSize: SizeConfig.blockSizeHorizontal * 4.3,
                                    fontFamily: 'Roboto_Bold',
                                    fontWeight: FontWeight.w600,
                                    color: CommonColor.WHITE_COLOR,)),
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top: parentHeight*0.03,left: parentWidth*0.03),
                                  child:
                                  Image(image: AssetImage("assets/images/editor.png"),height: parentHeight*0.03,),)
                                // Icon(Icons.edit),
                              ],
                            )
                          ],
                        ),

                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              bottom: parentHeight * 0.0,
              left: parentWidth * 0.0,
              right: parentWidth * 0.0),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10.0),),
            child: Container(
              height: parentHeight*0.1,
              decoration: BoxDecoration(
                  color: CommonColor.WHITE_COLOR
              ),


              child: Row(
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


                    child: Padding(
                      padding: EdgeInsets.only(top: parentHeight * 0.0, left: parentWidth * 0.15,
                        right: parentWidth * 0.028,),                              child: Container(
                        height: parentHeight * .06,
                        width: parentWidth*0.3,


                        decoration:  BoxDecoration(
                          color: CommonColor.SAVE_BUTTON,
                          borderRadius: BorderRadius.circular(10),


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
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: parentHeight * 0.0, left: parentWidth * 0.025,
                      right: parentWidth * 0.15,),                              child: Container(
                      height: parentHeight * .06,
                      width: parentWidth*0.3,


                      decoration:  BoxDecoration(
                        color: CommonColor.CANCLE_BUTTON,
                        borderRadius: BorderRadius.circular(10),


                      ),
                      child:Center(
                        child: Text("Cancle",style: TextStyle(
                            fontFamily: "Roboto_Regular",
                            fontWeight: FontWeight.w700,
                            fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                            color: CommonColor.WHITE_COLOR
                        ),),
                      )
                  ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

