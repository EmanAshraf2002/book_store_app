import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Search/presentations/views/widgets/SearchViewBody.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget{
  const SearchView({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchViewBody() ,

      ),
    );
  }
}