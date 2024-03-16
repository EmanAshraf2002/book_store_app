part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchFailure extends SearchState {
  final String errorMessage;
  SearchFailure(this.errorMessage);
}
class SearchSuccess extends SearchState {
  final List<BookModel> resultBooks;
  SearchSuccess(this.resultBooks);
}
