import 'package:bookly/core/widgets/custom_circular_progress_inidicator.dart';
import 'package:bookly/core/widgets/custom_error_message.dart';
import 'package:bookly/features/Home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/features/Home/presentation/views/widgets/better_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: BookListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorMessage(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomProgressIndicator();
        }
      },
    );
  }
}
