import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class FeaturedBooksStates extends Equatable{
  const FeaturedBooksStates();

  @override
  List<Object?> get props => [];
}
class FeaturedBooksInitial extends FeaturedBooksStates{}

class FeaturedBooksLoading extends FeaturedBooksStates{}

class FeaturedBooksFailure extends FeaturedBooksStates{
  final String errorMessage;
 const FeaturedBooksFailure(this.errorMessage);

}

class FeaturedBooksSuccess extends FeaturedBooksStates{
  final List<BookModel> books;
 const FeaturedBooksSuccess(this.books);

}
