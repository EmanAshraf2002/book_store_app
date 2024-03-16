import 'package:bloc/bloc.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/featured_books_cubit/featured_books_states.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksStates>{
  FeaturedBooksCubit(this.homeRepo):super(FeaturedBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errorMessage));
    },
     (books) {
      emit(FeaturedBooksSuccess(books));
     });

  }

}