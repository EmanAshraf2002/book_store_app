import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/custom_book_image_item.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/featured_books_cubit/featured_books_states.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit,FeaturedBooksStates>(
      builder: (context, state) {
        if(state is FeaturedBooksSuccess){
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return  Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: (){
                        GoRouter.of(context).push('/BookDetailsView' ,extra: state.books[index]);
                         },
                      child: CustomBookImageItem(
                        imageUrl:state.books[index].volumeInfo.imageLinks?.thumbnail??'',),
                    ),
                  );
                }
            ),
          );
        }
        else if (state is FeaturedBooksFailure){
          return CustomError(errorMessage: state.errorMessage);
        }
        else{
          return const CustomLoadingIndicator();
        }
      },

    );
  }


}