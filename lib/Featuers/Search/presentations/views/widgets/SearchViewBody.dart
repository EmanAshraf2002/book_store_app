import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Search/presentations/views/widgets/custom_search_textfield.dart';
import 'package:bookly_app/Featuers/Search/presentations/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget{
  const SearchViewBody({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 22,),
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          const  SizedBox(height: 16,),
          const  Text('Search Result' , style:  Styles.textStyle18,),
          const  SizedBox(height: 16,),
          const  Expanded(
              child: SearchResultListView() ,
          ),

        ],

      ),
    );
  }

}