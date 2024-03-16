import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:bookly_app/Core/functions/custom_lunch_url.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/book_actions_button.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/book_details_appbar.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/book_rating.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/details_list_view.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget{
  const BookDetailsBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child:  Padding(
           padding:const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
               const BookDetailsAppBar(),
               //section of book details
               Padding(
               padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                 child:CustomBookImageItem(
                   imageUrl:bookModel.volumeInfo.imageLinks?.thumbnail ??'' ,
                 ),
              ),
              const SizedBox(height:33,),
              Text(bookModel.volumeInfo.title! ,
               style: Styles.textStyle30,
               //textAlign: TextAlign.center,
               ),
              const SizedBox(height:6,),
              Text(bookModel.volumeInfo.authors?[0] ??'',
                style: Styles.textStyle18 .copyWith(
                fontStyle: FontStyle.italic ,
                color: Colors.white.withOpacity(0.7),
                ),
                ),
              const SizedBox(height:16,),
              BookRating(
              mainAxisAlignment: MainAxisAlignment.center,
              bookRating: bookModel.volumeInfo.averageRating ??0,
              ratingCount: bookModel.volumeInfo.ratingsCount ??0,
              ),
              const SizedBox(height:35,),
              BookActions(bookModel:bookModel,),
              //similar books list section
              const Expanded(child:SizedBox(height:36,)),
              //to make this item always in the end of the page
              // we make the sized box Expanded to take all the space it can
              //if any space more 36 it also take it
              Align(
              alignment: Alignment.centerLeft,
              child: Text(' You can also like ' ,
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
              ),
              ),
              const SizedBox(height:16,),
              const DetailsListView(),
              const SizedBox(height:30,),
        ],

        ),
        ),
      ),

         ],
    );

  }
}

