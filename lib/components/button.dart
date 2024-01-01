import 'package:calculator/constant.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.myColor, required this.title, required this.press});
  final Color myColor;
  final String title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: press,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: myColor,
          ),
          child: Center(child: Text(title,style: TextStyle(color: textColor,fontSize: textSize),)),
        ),
      ),
    );
  }
}
