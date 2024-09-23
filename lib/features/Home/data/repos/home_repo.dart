import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';

import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fectchNewstBooks();
  Future<Either<Failure, List<BookModel>>> fectchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fectchSimilarBook(
      {required String category});
}
