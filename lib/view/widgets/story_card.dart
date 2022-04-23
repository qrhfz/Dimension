import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/providers/item_notifier.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../common/extract_domain.dart';

class StoryCard extends ConsumerWidget {
  final int id;
  const StoryCard(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(itemFamily(id));
    return state.when(
      loading: () => const SizedBox(height: 64),
      data: (item) => ListTile(
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
            const Text(" • "),
            Text(TimeElapsed.fromDateTime(item.createdAt)),
          ],
        ),
        onTap: () {
          final url = item.url;
          if (url != null) {
            GoRouter.of(context).go('/browser', extra: url);
          } else {
            GoRouter.of(context).go('/comments/${item.id}', extra: item);
          }
        },
        trailing: GestureDetector(
          onTap: () {
            GoRouter.of(context).go('/comments/${item.id}', extra: item);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.chat),
              Text((item.descendantCount ?? 0).toString()),
            ],
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
