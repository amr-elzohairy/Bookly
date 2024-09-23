import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_buttos.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_image_item.dart';
import 'package:bookly/features/Home/presentation/views/widgets/similar_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SafeArea(child: BookDetailsAppBar()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: BookImageItem(
                    bookImage: bookModel.volumeInfo.imageLinks.thumbnail,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  bookModel.volumeInfo.title!,
                  style:
                      Style.textStyle30.copyWith(fontWeight: FontWeight.bold),
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo.authors![0],
                    style:
                        Style.textStyle18.copyWith(fontStyle: FontStyle.italic),
                  ),
                ),
                const SizedBox(
                  height: 17,
                ),
                BookRating(
                  count: bookModel.volumeInfo.pageCount!,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                BookDetailsButtons(
                  bookModel: bookModel,
                ),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style:
                        Style.textStyle16.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SimilarListView(),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
