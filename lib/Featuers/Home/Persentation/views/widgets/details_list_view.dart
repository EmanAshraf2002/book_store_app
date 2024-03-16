import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsListView extends StatelessWidget {
  const DetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.15,
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if(state is SimilarBooksSuccess){
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:const  EdgeInsets.symmetric(horizontal: 5),
                    child: CustomBookImageItem(
                      imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ??'',
                    ),
                  );
                });
          }
          else if(state is SimilarBooksIFailure){
            return CustomError(errorMessage: state.errorMessage);
          }
          else{
            return const  CustomLoadingIndicator();
          }
        },
      ),
    );
  }


}