import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:equatable/equatable.dart';

abstract class NewestBookStates extends Equatable{
  const NewestBookStates();

  @override
  List<Object?> get props => [];
}
class NewestBooksInitial extends NewestBookStates{}

class NewestBooksLoading extends NewestBookStates{}

class NewestBooksFailure extends NewestBookStates{
  final String errorMessage;
  const NewestBooksFailure(this.errorMessage);
}

class NewestBooksSuccess extends NewestBookStates{
  final List<BookModel> books;

 const  NewestBooksSuccess(this.books);

}