import 'package:bookly_app/Core/Utlis/styles.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/BooksListView.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/bestseller_listview.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget{
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {

    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: CustomAppBar(),
              ),
              BooksListView(),
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text('Best Seller' , style:  Styles.textStyle18,),
              ),
              SizedBox(height:20,),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22),
            child: BestSellerListView(),
          ),
        )
      ],

    );

  }

}