import 'package:flutter/material.dart';
import 'package:payment_app/colors.dart';
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
            _headSection(h*0.4),
            _listOfBills(),
          ]
        ),
      ),
    );
    
  }

  // A function containing the headSection items in a Stack widget
  _headSection(var height){
    return Container(
      height: height,
      child: Stack(
        children: [
          _mainBackground(), // returning a Positioned widget which contains the actual contents of this section
          _backgroundCurve(),
          _buttonContainer(),
        ],
      ),
    );
  }

// The function returning the actual contents
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

  // A function which returns a positioned widget containing the curve image
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
    );
  }


  _listOfBills(){
    return Positioned(
      top: MediaQuery.of(context).size.height*0.48,
      child: Container(
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
            children: [
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
            ],
          ),
        ),
      ),
    );
  }



}