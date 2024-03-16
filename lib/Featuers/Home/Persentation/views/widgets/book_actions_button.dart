import 'package:bookly_app/Core/functions/custom_lunch_url.dart';
import 'package:bookly_app/Core/widgets/custom_button.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:flutter/material.dart';


class BookActions extends StatelessWidget{
  const BookActions({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
                text: 'Free',
                backgroundColor:Colors.white,
                textColor: Colors.black ,
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(16)  ,
                    bottomLeft:Radius.circular(16) ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: (){
                launchCustomUr(context,bookModel.volumeInfo.previewLink);
                },
              text: getText(bookModel),
              backgroundColor:const Color(0xffEf8262),
              textColor: Colors.white ,
              borderRadius:const BorderRadius.only(
                  topRight:Radius.circular(16)  ,
                  bottomRight:Radius.circular(16) ),
            ),
          ),

        ],
      ),
    );
  }

 String getText(BookModel bookModel) {
    if(bookModel.volumeInfo.previewLink ==null ){
      return 'Not Available';
    }
    else{
      return 'Preview' ;
    }
 }

}