import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indicator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly_app/Featuers/Search/presentations/views_model_manager/Search_Cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit,SearchState>(
      builder: (context, state) {
        if(state is SearchSuccess) {
          return ListView.builder(
              itemCount:state.resultBooks.length ,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Padding(
                  padding:const EdgeInsets.symmetric(vertical: 10),
                  //this child is the book with it's info
                  child: BestSellerListViewItem(book:state.resultBooks[index],),
                );
              }
          );
        }
        else if(state is SearchFailure)
          {
            return CustomError(errorMessage: state.errorMessage);
          }
        else if(state is SearchInitial)
        {
          return const Center(child: Text('No results yet'),);
        }

        else
        {
          return const CustomLoadingIndicator();
        }
      },
    );
  }

}