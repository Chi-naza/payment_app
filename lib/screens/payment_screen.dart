import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payment_app/colors.dart';
import 'package:payment_app/screens/home.dart';
import 'package:payment_app/widgets/large_button.dart';
import 'package:payment_app/widgets/special_icons.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(        
        height: h,
        width: w,
        padding: EdgeInsets.only(top: h*0.09, left: h*0.04, right: h*0.04),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/paymentbackground.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            // the success image
            Container(
              height: h * 0.14,
              width: double.maxFinite,
              decoration: const BoxDecoration(                
                image: DecorationImage(
                  image: AssetImage('images/success.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // the success text
            Text(
              'Success !',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColor.mainColor,
              ),
            ),
            // payment completed for . . . text
            Text(
              'Payment completed for 2 bills',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: AppColor.idColor,
              ),
            ),
            SizedBox(height: h * 0.03),
            // Mother Container for the bills details
            Container(
              height: h * 0.2,
              width: 360,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  width: 2,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
              // child container housing a column of bill details (Wrapped with ListView.builder)
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true, // removing listViews default padding
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.all(h*0.009),
                      child: Column(
                        children: [
                          // Row housing the actual bill detail items: icon, text and amount.
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // for the 'green done icon'
                              Container(
                                // margin: EdgeInsets.only(top: 15, left: 20),
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.green,
                                ),
                                child: const Icon(Icons.done, size: 30, color: Colors.white),
                              ),
                              // column for the two middle texts
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // name and description
                                  Text(
                                    'Nazzy World',
                                    style: TextStyle(
                                      color: AppColor.mainColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  // ID text
                                  Text(
                                    'ID: 36482511',
                                    style: TextStyle(
                                      color: AppColor.idColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              // for the last item in the row
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [                           
                                  Text(""), // to be able to push the text to the end
                                  Text(
                                    '\$2361.09',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.mainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // The divider at the end of each row: i.e payment detail
                          Divider(thickness: 2, color: Colors.grey.withOpacity(0.5)), 
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: h * 0.03),
            //Total Amount and 'amount' text Column section
            Column(
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColor.idColor,
                  ),
                ),
                Text(
                  '\$4312.00',
                  style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 2.0,
                    color: AppColor.mainColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.09),
            // Share and Print icons : we use our specialIcons (the widget we created)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpecialIcons(icon: Icons.share_outlined, text: 'share'), // share icon & text
                SizedBox(width: h * 0.04),
                SpecialIcons(icon: Icons.print_outlined, text: 'print'), // print icon & text
              ],
            ),
            SizedBox(height: h *  0.03),
            // The DONE text at the end of the screen
            CustomLargeButton(
              text: 'Done',
              backgroundColor: Colors.white,
              textColor: AppColor.mainColor,
              onTap: (){
                Get.to(() => HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}