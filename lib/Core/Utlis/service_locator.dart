import 'package:bookly_app/Core/Utlis/api_services.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo_implemetation.dart';
import 'package:bookly_app/Featuers/Search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerSingleton<HomeRepoImplementation>(HomeRepoImplementation(
    getIt.get<ApiServices>(),
  ));

  getIt.registerSingleton<SearchRepoImplementation>(SearchRepoImplementation(
    getIt.get<ApiServices>(),
  ));
}