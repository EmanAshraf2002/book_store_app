import 'package:bookly_app/Core/Utlis/assetsLinks.dart';
import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget{
  const BestSellerListViewItem({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        GoRouter.of(context).push('/BookDetailsView' , extra: book);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImageItem(imageUrl:book.volumeInfo.imageLinks?.thumbnail??''),
            const SizedBox(width: 30,),
              Expanded(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(
                     width: MediaQuery.of(context).size.width * 0.5 ,
                     child:Text(book.volumeInfo.title! ,
                      style:Styles.textStyle20.copyWith(fontFamily: kGTSectraFine),
                      maxLines: 2,
                      overflow:TextOverflow.ellipsis,),
                  ),
                   const SizedBox(height: 3,),
                   Text(book.volumeInfo.authors?[0] ??'', style: Styles.textStyle14,),
                   const SizedBox(height: 3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('free' ,
                         style: Styles.textStyle20.copyWith(
                             fontWeight: FontWeight.bold,
                             fontFamily: kGTSectraFine),
                         ),
                       BookRating(
                         bookRating:book.volumeInfo.averageRating ?? 0,
                         ratingCount:book.volumeInfo.ratingsCount ?? 0,
                         ),

                     ],
                   ),


                ],
            ),
              )

          ],
        ),

      ),
    );
  }

}