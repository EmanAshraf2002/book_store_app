import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  const CustomButton({super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius,
    this.onPressed});

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius ? borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
     return SizedBox(
       height: 54,
       child: TextButton(
           style: TextButton.styleFrom(
             backgroundColor: backgroundColor,
             shape:RoundedRectangleBorder(
               borderRadius:borderRadius?? BorderRadius.circular(16),
             )
           ),
           onPressed: onPressed,
           child: Text(text ,
             style:Styles.textStyle18.copyWith(
               color: textColor,
                fontWeight: FontWeight.w800
             ),
           ),

       ),
     );
  }


}