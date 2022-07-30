import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/colors.dart';
import 'package:payment_app/screens/payment_screen.dart';
import 'package:payment_app/widgets/large_button.dart';
import 'package:payment_app/widgets/special_icons.dart';
import 'package:payment_app/widgets/text_size.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Container(
        height: h,
        child: Stack(
          children: [
            _headSection(h*0.38),
            _listOfBills(),
            _payButton(),            
          ]
        ),
      ),
    );
    
  }

  // A function containing the headerSection items in a Stack widget
  _headSection(var height){
    return Container(
      height: height,
      child: Stack(
        children: [
          _mainBackground(), // returning a Positioned widget which contains the actual contents of this section
          _backgroundCurve(),
          _buttonContainer(),
          _textContainer(),
        ],
      ),
    );
  }

// The function returning header background image
  _mainBackground(){
    return Positioned(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }

  // A function which returns a positioned widget containing the curve (image) on the header
  _backgroundCurve(){
    return Positioned(
      left: 0,
      right: -2,
      bottom: 0,
      child: Container(        
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: BoxDecoration(
          // color: Colors.amber,
          image: DecorationImage(
            image: AssetImage('images/curve.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Returning the button on the header
  _buttonContainer(){
    return Positioned(
      bottom: 0,
      left: MediaQuery.of(context).size.height * 0.44,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet<dynamic>(
            context: context, 
            barrierColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            isScrollControlled: true, // to be able to control the height
            builder: (BuildContext bc){
              return Container(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height*0.3,
                child:Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color:  Color(0xFFeef1f4).withOpacity(0.7),
                        height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height*0.38,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      left: MediaQuery.of(context).size.height * 0.44,
                      child: Container(                                              
                         width: 60,
                         height: 250,
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29),
                          color: AppColor.mainColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // first icon 
                            SpecialIcons(
                              icon: Icons.cancel,
                              iconColor: AppColor.mainColor,
                              onTap: () => Navigator.pop(context),
                              backgroundColor: Colors.white,
                            ),
                            // first second 
                            SpecialIcons(
                              icon: Icons.add,
                              iconColor: AppColor.mainColor,
                              backgroundColor: Colors.white,
                              textColor: Colors.white,
                              text: 'Add Bill',
                            ),
                            // third icon 
                            SpecialIcons(
                              icon: Icons.history,
                              iconColor: AppColor.mainColor,                              
                              backgroundColor: Colors.white,
                              textColor: Colors.white,
                              text: 'History',
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.01)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height*0.08,
          width: MediaQuery.of(context).size.height*0.08,
          decoration: BoxDecoration(
            // boxShadow: [
            //   BoxShadow(
            //     offset: Offset(0, 1),
            //     blurRadius: 30,
            //     color: Color(0xFF11324d).withOpacity(0.2)
            //   )
            // ],
            image: DecorationImage(
              image: AssetImage('images/lines.png')
            ),
          ),
        ),
      ),
    );
  }

  // returning the list of Bill cards generated by listViewBuilder
  _listOfBills(){
    return Positioned(
      top: MediaQuery.of(context).size.height*0.4,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height*0.09,
      // ListViewBuilder to generate our cards as much as possible.
      // if  you are using listViewBuilder on a positioned widget, you have to give top, right, left and bottom values.
      // Wrapped with MediaQuery.removePadding in order to remove the padding introduced by ListViewBuilder
      child: MediaQuery.removePadding(
        context: context,
        removeBottom: true,
        removeTop: true,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: ((_, index) {
            return Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.03, 
                right: MediaQuery.of(context).size.height*0.03,
                // bottom: MediaQuery.of(context).size.height*0.8,
              ),
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width - 20,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(1, 1),
                    color: Color(0xFFd8dbe0),
                    spreadRadius: 10,
                    blurRadius: 20,
                  ),
                ]
              ),
              // Container for the bill content
              child: Container(
                margin: const EdgeInsets.only(top: 10, left: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // first column in the row. with image, title and dot lines
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            //container for brand image
                            Container(        
                              height: MediaQuery.of(context).size.height*0.075,
                              width: MediaQuery.of(context).size.height*0.075,
                              decoration: BoxDecoration(                          
                                image: DecorationImage(
                                  image: AssetImage('images/brand1.png'),
                                  fit: BoxFit.cover,
                                ),
                                border: Border.all(
                                  width: 3,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.height*0.02),
                            // column of texts beside the row
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nazzy World',
                                  style: TextStyle(
                                    color: AppColor.mainColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height*0.018),
                                Text(
                                  'ID: 27393038',
                                  style: TextStyle(
                                    color: AppColor.idColor,
                                    fontSize: 14,                              
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.05),
                        // text: successful pay . .  .
                        SizedText(text: 'Successful pay on 27th July, 2020', color: Colors.green),
                      ],
                    ),
                    // This row houses the column containing the select button, amount, and the 'Due in . . .' text. Plus a container at the end
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(        
                              // height: MediaQuery.of(context).size.height*0.075,
                              // width: MediaQuery.of(context).size.height*0.075,
                              height: 30,
                              width: 80,
                              decoration: BoxDecoration(                          
                                borderRadius: BorderRadius.circular(30),
                                color: AppColor.selectBackground,
                              ),
                              child: Center(
                                child: Text(
                                  'Select',
                                  style: TextStyle(
                                    color: AppColor.selectColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            // Spacer widget giving maximum space between two widgets
                            Spacer(),
                            // The bold text below select button
                            Text(
                              '\$4563.11',
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              'Due in 5 days',
                              style: TextStyle(
                                color: AppColor.idColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 15) // this sizedBox is to give a space at the bottom of this column
                          ],
                        ),
                        SizedBox(width: 5),
                        // Container with the dash
                      Container(        
                          height: 35,
                          width: 5,
                          decoration: BoxDecoration( 
                            color: AppColor.halfOval ,                      
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(30),
                              bottomLeft: Radius.circular(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }


  // returning the pay button at the bottom of the screen
  _payButton(){
    return Positioned(
      bottom: MediaQuery.of(context).size.height*0.01,
      child: CustomLargeButton(
        text: 'Pay all bills',
        textColor: Colors.white,
        onTap: () {
          Get.to(() => PaymentScreen());
        },
      ),
    );
  }

  // A function returning the two 'My Bills' texts
  _textContainer(){
    return Stack(
      children: const [
        // My Bill bigger text
        Positioned(
          left: 0,
          top: 100,
          child: Text(
            'My Bills',
            style: TextStyle(
              fontSize: 70,
              fontWeight: FontWeight.bold,
              color: Color(0xFF293952),
            ),
          ),
        ),
        // My Bill text
        Positioned(
          left: 40,
          top: 80,
          child: Text(
            'My Bills',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),           
      ],
    );
  }

}