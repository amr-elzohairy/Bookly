import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_circular_progress_inidicator.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/features/Home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSucces) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView
                    , extra: state.books[index]),
                    child: BookImageItem(
                        bookImage:
                            state.books[index].volumeInfo.imageLinks.thumbnail),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorMessage(errMessage: state.errMessage);
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
