import 'package:flutter/material.dart';
import 'package:payment_app/colors.dart';

class SpecialIcons extends StatelessWidget {
   final double? fontSize;
   final IconData icon;
   final VoidCallback? onTap;
   final Color? backgroundColor;
   final Color? iconColor;
   final Color? textColor;
   final String? text;
   
  const SpecialIcons({
    Key? key, 
    this.fontSize = 20,
     required this.icon, 
     this.onTap, 
     this.backgroundColor = AppColor.mainColor, 
     this.iconColor = Colors.white, 
     this.textColor = AppColor.mainColor,
     this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: h*0.02), 
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 30,
            ),
          ),
          SizedBox(height: h*0.009),
          // for the text below the button icon
          text!=null? Text(
            text!,
            style: TextStyle(fontSize: 14, color: textColor),
          ): Container(),
        ],
      ),
    );
  }
}