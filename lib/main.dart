import 'package:bookly_app/Core/Utlis/api_services.dart';
import 'package:bookly_app/Core/Utlis/app_routs.dart';
import 'package:bookly_app/Core/Utlis/service_locator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/newest_book_cubit/newest_book_cubit.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo_implemetation.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';



void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>
           //Traditional Way
           // FeaturedBooksCubit(HomeRepoImplementation(ApiServices(Dio()) )
           //  )..fetchFeaturedBooks(),
           // With gitit service locator
           FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())..fetchFeaturedBooks(),
        ),
        BlocProvider(create: (context) =>
           NewestBooksCubit(getIt.get<HomeRepoImplementation>())..fetchBestSellerBooks()
        ),

      ],
      child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kPrimaryColor,
              textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme) ,
          ),

           ),
    );
  }
}

