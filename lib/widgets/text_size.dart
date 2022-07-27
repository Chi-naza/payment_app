import 'package:flutter/material.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  
  const SizedText({Key? key, required this.text, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
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
      ],
    );
  }


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