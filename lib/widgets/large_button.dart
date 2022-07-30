import 'package:flutter/material.dart';
import 'package:payment_app/colors.dart';

class CustomLargeButton extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Function()? onTap;
  final bool? isBorder;
  
  const CustomLargeButton({
    Key? key, 
    required this.text,
    this.backgroundColor = AppColor.mainColor, 
    this.textColor, 
    this.onTap, 
    this.isBorder = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h  = MediaQuery.of(context).size.height;
    var w  = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.08,
        width: w - 70,
        margin: EdgeInsets.only(left: 35, right: 35),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(h * 0.01),
          border: Border.all(
            width: 2,
            color: AppColor.mainColor,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: h * 0.05,
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}