import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/item/item_notifier.dart';
import '/thread/thread_page.dart';
import '/item/visit_notifier.dart';
import '/widgets/favicon.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/extract_domain.dart';
import '../models/item.dart';

class StoryCard extends ConsumerWidget {
  final int id;
  const StoryCard(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final state = ref.watch(itemFamily(id));
    final visitState = ref.watch(visitationFamily(id));

    return state.when(
      loading: () => const StoryCardPlaceholder(),
      data: (item) => StoryCardContent(
        item,
        visited: visitState,
      ),
      error: (message) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(message),
      ),
    );
  }
}

class StoryCardContent extends StatelessWidget {
  const StoryCardContent(
    this.item, {
    required this.visited,
    Key? key,
  }) : super(key: key);

  final Item item;
  final bool visited;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () async {
              GoRouter.of(context).go(ThreadPage.routeBuilder(item.id));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item.title ?? "no title",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontWeight: visited ? FontWeight.w400 : FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                          text:
                              " (${extractDomain(item.url ?? "") ?? "self.hackernews"})",
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  DefaultTextStyle(
                    style: Theme.of(context).textTheme.caption!,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_circle_up_rounded,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text((item.score ?? 0).toString()),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.chat_rounded,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text((item.descendantCount ?? 0).toString()),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${TimeElapsed.fromDateTime(item.createdAt)} ago",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            final url = item.url;
            if (url != null) {
              launchUrl(Uri.parse(url));
            } else {
              GoRouter.of(context).go(ThreadPage.routeBuilder(item.id));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(8.0),
              width: 32,
              height: 32,
              child: Favicon(item.url),
            ),
          ),
        ),
      ],
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
          color: Theme.of(context).colorScheme.surfaceVariant,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 128,
            height: 16,
            color: Theme.of(context).colorScheme.surfaceVariant,
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
