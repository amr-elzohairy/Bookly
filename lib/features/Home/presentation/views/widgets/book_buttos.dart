import 'package:bookly/core/widgets/custom_text_button.dart';
import 'package:bookly/features/Home/data/models/book_model/book.model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsButtons extends StatelessWidget {
  const BookDetailsButtons({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextButton(
              bgColor: Colors.white,
              text: 'Free',
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
            ),
          ),
          Expanded(
            child: CustomTextButton(
              onPressed: () async {
                var uri = Uri.parse(bookModel.volumeInfo.previewLink!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              fontSize: 16,
              bgColor: const Color(0xffEF8262),
              text: getText(bookModel),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return 'Not for sale';
    } else {
      return 'Preview';
    }
  }
}
