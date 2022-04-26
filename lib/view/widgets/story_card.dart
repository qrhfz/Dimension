import 'package:cached_network_image/cached_network_image.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              GoRouter.of(context).go('/thread/${item.id}');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: item.title ?? "",
                      style: Theme.of(context).textTheme.bodyText1,
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              padding: const EdgeInsets.all(8.0),
              width: 32,
              height: 32,
              child: WebIcon(item.url),
            ),
          ),
        ),
      ],
    );
  }
}

class WebIcon extends StatelessWidget {
  const WebIcon(this.url, {Key? key}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: "https://${extractDomain(url!)}/favicon.ico",
        errorWidget: (ctx, s, _) {
          return const Icon(Icons.link_rounded, size: 16);
        },
        placeholder: (ctx, s) {
          return const Icon(Icons.link_rounded, size: 16);
        },
      );
    }
    return const Icon(Icons.link_rounded, size: 16);
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
