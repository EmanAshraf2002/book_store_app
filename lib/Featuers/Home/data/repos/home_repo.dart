import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{
  Future<Either<Failure ,List<BookModel >>> fetchBestsellerBooks();
  Future<Either<Failure ,List<BookModel >>> fetchFeaturedBooks();
  Future<Either<Failure ,List<BookModel >>> fetchSimilarBooks({required String category});

}