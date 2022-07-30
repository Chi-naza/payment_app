import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  
  const SizedText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    print("TextSize: $textSize");
    print("TextSize.Width: ${textSize.width}");
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          overflow: TextOverflow.clip,
          softWrap: false,
        ),
        SizedBox(height: 5),
        // The Row where the dot lines are drawn with the help of textSize/textSize function
        Row(
          children: [
            for(int i = 0; i<textSize.width/5; i++)
              i.isEven?Container(
                width: 5,
                height: 2,
                color: color,
              )
              :
              Container(
                width: 5,
                height: 2,
                color: Colors.white,
              ),
          ],
        ),
      ],
    );
  }

// This is a textSize: it willj
  Size _textSize(String text){
    final TextPainter textPainter = TextPainter(
      maxLines: 1,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    )..layout(minWidth: 0.0, maxWidth: double.infinity);  

    return textPainter.size;
  }
}