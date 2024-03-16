import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{

  Future<Either<Failure ,List<BookModel >>> fetchSearchedBooks({required String category});

}