import 'package:bookly/core/widgets/custom_circular_progress_inidicator.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/features/Home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarListView extends StatelessWidget {
  const SimilarListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: BookImageItem(
                    bookImage:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailute) {
          return CustomErrorMessage(
            errMessage: state.errMessage,
          );
        }else{
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
