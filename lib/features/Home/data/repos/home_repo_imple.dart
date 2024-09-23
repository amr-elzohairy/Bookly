import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:bookly/features/Home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImple(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fectchNewstBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&sorting=newst&q=subject:C#');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fectchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:programming');
      List<BookModel> featureBooks = [];
      for (var item in data['items']) {
        featureBooks.add(BookModel.fromJson(item));
      }
      return right(featureBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  
  @override
  Future<Either<Failure, List<BookModel>>> fectchSimilarBook({required String category}) async{
    try {
      var data = await apiServices.get(
          endPoint:
              'volumes?Filtering=free-ebooks&sorting=relevance&q=subject:programming');

      List<BookModel> similarBooks = [];
      for (var item in data['items']) {
        similarBooks.add(BookModel.fromJson(item));
      }
      return right(similarBooks);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
