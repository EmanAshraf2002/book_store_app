import 'package:bloc/bloc.dart';
import 'package:bookly_app/Featuers/Home/Persentation/views_model_manager/newest_book_cubit/newest_book_states.dart';
import 'package:bookly_app/Featuers/Home/data/repos/home_repo.dart';

class NewestBooksCubit extends Cubit<NewestBookStates>{
  NewestBooksCubit(this.homeRepo):super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchBestSellerBooks()  async{
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchBestsellerBooks();
    result.fold((failure) {
      emit(NewestBooksFailure(failure.errorMessage));
    },
      (books) {
      emit(NewestBooksSuccess(books));
      }
    );

  }



}