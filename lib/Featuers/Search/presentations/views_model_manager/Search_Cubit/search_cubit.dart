import 'package:bloc/bloc.dart';
import 'package:bookly_app/Core/errors/failures.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;

  Future<void> fetchSearchedBooks({required String cat}) async{
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(category:cat);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
       },
       (resultBooks) {
      emit(SearchSuccess(resultBooks));
       });
    
  }




}
