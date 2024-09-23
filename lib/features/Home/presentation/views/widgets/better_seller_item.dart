import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/Home/presentation/views/widgets/book_image_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: InkWell(
        onTap: () => GoRouter.of(context).push(AppRouter.kBookDetailsView , extra: bookModel),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 125,
              child: BookImageItem(
                  bookImage: bookModel.volumeInfo.imageLinks.thumbnail),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      bookModel.volumeInfo.title!,
                      maxLines: 2,
                      style: Style.textStyle20,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Text(
                    maxLines: 1,
                    bookModel.volumeInfo.authors![0],
                    style: Style.textStyle14
                        .copyWith(color: const Color(0xff807E88)),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Free',
                        style: Style.textStyle18.copyWith(
                          fontFamily: 'Montserrat-Bold',
                        ),
                      ),
                      BookRating(
                        count: bookModel.volumeInfo.pageCount!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
