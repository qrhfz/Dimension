import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/providers/item_notifier.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../common/extract_domain.dart';
import '../../models/item.dart';

class StoryCard extends ConsumerWidget {
  final int id;
  const StoryCard(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(itemFamily(id));
    return state.when(
      loading: () => const StoryCardPlaceholder(),
      data: (item) => StoryTile(item),
      error: (message) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(message),
      ),
    );
  }
}

class StoryTile extends StatelessWidget {
  const StoryTile(
    this.item, {
    Key? key,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                final url = item.url;
                if (url != null) {
                  GoRouter.of(context).go('/browser', extra: url);
                } else {
                  GoRouter.of(context).go('/thread/${item.id}');
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title ?? "",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    DefaultTextStyle(
                      style: Theme.of(context).textTheme.subtitle1!,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            item.url != null
                                ? extractDomain(item.url!) ?? "no domain"
                                : "hackernews",
                          ),
                          const Icon(
                            Icons.arrow_drop_up_sharp,
                            size: 24,
                            color: Colors.grey,
                          ),
                          Text((item.score ?? 0).toString()),
                          dotSeparator,
                          Text(TimeElapsed.fromDateTime(item.createdAt)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).go('/thread/${item.id}');
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: 48,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.comment_rounded,
                    color: Theme.of(context).colorScheme.primaryContainer,
                  ),
                  Text((item.descendantCount ?? 0).toString()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCardPlaceholder extends StatelessWidget {
  const StoryCardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          height: 20,
          color: Colors.grey.shade300,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 128,
            height: 16,
            color: Colors.grey.shade300,
          ),
        ),
      ),
      trailing: Container(
        width: 24,
        height: 32,
        color: Colors.grey.shade300,
      ),
    );
  }
}
