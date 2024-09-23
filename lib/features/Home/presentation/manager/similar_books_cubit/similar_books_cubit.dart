import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:bookly/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoding());
    var result = await homeRepo.fectchSimilarBook(category: category);

    result.fold((failure) {
      emit(SimilarBooksFailute(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
