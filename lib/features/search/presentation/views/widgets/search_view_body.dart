import 'package:bookly/core/utils/style.dart';
import 'package:bookly/features/Home/presentation/views/widgets/search_list_view.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Search result',
              style: Style.textStyle18,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SearchListView(),
          )),
        ],
      ),
    );
  }
}
