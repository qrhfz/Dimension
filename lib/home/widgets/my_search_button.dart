import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search/my_search_delegate.dart';
import '../search/search.dart' as cs;

class SearchButton extends ConsumerWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
      onPressed: () {
        cs.showSearch(
          context: context,
          delegate: MySearchDelegate(),
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}
