import 'package:bookly_app/Core/Utlis/api_services.dart';
import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation  implements HomeRepo{
  final ApiServices apiServices;
  HomeRepoImplementation(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestsellerBooks() async{
    try {
      //data is the map that contain all data in api
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&sorting=newest&q=computer science');
      List<BookModel> books=[];
      for( var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }
    on Exception catch (e) {
      if (e is DioError) {
        return left( ServerFailure.fromDioError(e), );
      }
      return left(
        ServerFailure( e.toString(),), );
    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{

    try {
      //data is the map that contain all data in api
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=programming');
      List<BookModel> books=[];
      for( var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }
    on Exception catch (e) {
      if (e is DioError) {
        return left( ServerFailure.fromDioError(e), );
      }
      return left(
        ServerFailure( e.toString(),), );
    }

  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async {
    try {
      //data is the map that contain all data in api
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&sorting=relevance&q=programming');
      List<BookModel> books=[];
      for( var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return Right(books);
    }
    on Exception catch (e) {
    if (e is DioError) {
    return left( ServerFailure.fromDioError(e), );
    }
    return left(
    ServerFailure( e.toString(),), );
    }

  }

}