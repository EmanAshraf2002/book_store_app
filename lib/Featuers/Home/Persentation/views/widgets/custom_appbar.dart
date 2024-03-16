import 'package:bookly_app/Core/Utlis/assetsLinks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget{
  const  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only( top: 34,bottom: 20),
      child: Row(
        children: [
          Image.asset(AssetsLinks.logo ,
          height: 24,),

          const Spacer(),

          IconButton(onPressed: (){
            GoRouter.of(context).push('/SearchView');
          },
              icon:const Icon(Icons.search_rounded ,
               size: 25,),
            ),
        ],



      ),
    );
  }



}