import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/Home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/Home/presentation/views/widgets/custom_appbar.dart';
import 'package:bookly/features/Home/presentation/views/widgets/featured_book_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 19),
          child: CustomAppBar(),
        ),
        FeaturedBookListView(),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            'Newest Book',
            style: Style.textStyle18,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(child: BestSellerListView()),
      ],
    );
  }
}
