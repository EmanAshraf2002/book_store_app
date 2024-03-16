import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/book_details_body.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget{
  const BookDetailsView({super.key, required this.book});

  final BookModel book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: widget.book.volumeInfo.categories![0] );
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(
        child: BookDetailsBody(bookModel: widget.book,),
      ),
    );

  }
}