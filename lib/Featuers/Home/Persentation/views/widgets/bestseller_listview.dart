import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/newest_book_cubit/newest_book_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBookStates>(
      builder: (context, state) {
        if(state is NewestBooksSuccess){
         return ListView.builder(
              itemCount: state.books.length,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const  EdgeInsets.symmetric(vertical: 10),
                  child: BestSellerListViewItem(book: state.books[index] ,),
                );
              }

          );
        }
        else if(state is NewestBooksFailure){
           return CustomError(errorMessage: state.errorMessage);
        }
        else{
          return const CustomLoadingIndicator();
        }
      },
    );
  }


}