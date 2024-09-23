import 'package:bloc/bloc.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:bookly/features/Home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeatureBooks() async {
    var result = await homeRepo.fectchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBooksFailure(failure.errMessage));
    }, (books) {
      emit(FeaturedBooksSucces(books));
    });
  }
}
