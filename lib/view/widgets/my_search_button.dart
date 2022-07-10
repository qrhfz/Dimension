import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../pages/my_search_delegate.dart';

class SearchButton extends ConsumerWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return IconButton(
      onPressed: () {
        showSearch(
          context: context,
          delegate: MySearchDelegate(ref),
        );
      },
      icon: const Icon(Icons.search),
    );
  }
}
