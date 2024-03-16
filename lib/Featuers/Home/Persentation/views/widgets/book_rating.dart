import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget{
  const BookRating({super.key
    ,this.mainAxisAlignment=MainAxisAlignment.start,
    required this.bookRating,
    required this.ratingCount});

  final MainAxisAlignment mainAxisAlignment;
  final num bookRating;
  final int ratingCount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star ,color: Color(0xffFFDD4f) ,),
        const SizedBox(width: 5,),
        Text(bookRating.toString() ,style: Styles.textStyle16,),
        const SizedBox(width:5,),
        Text('( $ratingCount )' ,
          style: Styles.textStyle14.copyWith(
            color:Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600
          ),
        ),

      ],

    );
  }

}