import 'package:bloc/bloc.dart';
import 'package:bookly_app/Featuers/Home/data/models/book_model.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category})  async{
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksIFailure(failure.errorMessage));
    },
     (books) {
          emit(SimilarBooksSuccess(books));
        }
    );

  }
}
