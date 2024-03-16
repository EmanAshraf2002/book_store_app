import 'package:bookly_app/Core/Utlis/api_services.dart';
import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo{
  final ApiServices apiServices;

  SearchRepoImplementation(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({required String category}) async {
    var data = await apiServices.get(
        endPoint: 'volumes?q=subject:$category&Filtering=free-ebooks');

    try {
      List<BookModel> booksList = [];

      for (var item in data['items']) {
        booksList.add(BookModel.fromJson(item));
      }
      return right(booksList);
    }
    on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e),);
      }
      return left(
        ServerFailure(e.toString(),),);
    }
  }

  }
