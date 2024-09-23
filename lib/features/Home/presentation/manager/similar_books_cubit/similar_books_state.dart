part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksLoding extends SimilarBooksState {}
final class SimilarBooksFailute extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailute(this.errMessage);
}
final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksSuccess(this.books);
}
