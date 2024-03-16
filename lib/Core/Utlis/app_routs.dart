import 'package:bookly_app/Core/Utlis/service_locator.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/BookDetailsView.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/BooksListView.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views/widgets/HomeView.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo_implemetation.dart';
import 'package:bookly_app/Featuers/Search/data/repos/search_repo_impl.dart';
import 'package:bookly_app/Featuers/Search/presentations/views/widgets/search_view.dart';
import 'package:bookly_app/Featuers/Search/presentations/views_model_manager/Search_Cubit/search_cubit.dart';
import 'package:bookly_app/Featuers/splash/persentation/Views/widgets/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter{

   static final GoRouter router = GoRouter(
    routes:[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
         ),
          GoRoute(
            path: '/HomeView',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeView();
            },
          ),
      GoRoute(
        path: '/BookDetailsView',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
             create: (context) =>SimilarBooksCubit(getIt.get<HomeRepoImplementation>()),
              child:  BookDetailsView(book: state.extra as BookModel,)
          );
        },
      ),
      GoRoute(
        path: '/SearchView',
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider
            (create: (BuildContext context) =>
              SearchCubit(getIt.get<SearchRepoImplementation>()),
            child:const SearchView()
          );
        },
      ),

    ],
  );

}