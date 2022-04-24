import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/providers/item_notifier.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../common/extract_domain.dart';

class StoryCard extends ConsumerWidget {
  final int id;
  const StoryCard(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(itemFamily(id));
    return state.when(
      loading: () => const StoryCardPlaceholder(),
      data: (item) => ListTile(
        isThreeLine: true,
        title: Text(item.title ?? ""),
        subtitle: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(item.url != null
                ? extractDomain(item.url!) ?? "no domain"
                : "self"),
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
        onTap: () {
          final url = item.url;
          if (url != null) {
            GoRouter.of(context).go('/browser', extra: url);
          } else {
            GoRouter.of(context).go('/thread/${item.id}', extra: item);
          }
        },
        trailing: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/thread/${item.id}', extra: item);
          },
          child: SizedBox(
            width: 48,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.chat),
                  Text((item.descendantCount ?? 0).toString()),
                ],
              ),
            ),
          ),
        ),
      ),
      error: (message) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(message),
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
