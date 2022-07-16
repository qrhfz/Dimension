import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/item_detail.dart';

import 'package:hn_client/thread/comment/body.dart';
import 'package:hn_client/widgets/dot_separator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../item/item_detail/item_detail_notifier.dart';
import '../item/story_notifier.dart';
import '../widgets/dot_separator.dart';
import 'comment/comment_tile.dart';

class ThreadPage extends ConsumerWidget {
  static String routeBuilder(int id) => "/item?id=$id";

  final int id;
  const ThreadPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemDetailFamily(id));
    final notifier = ref.read(itemDetailFamily(id).notifier);
    ref.read(storyFamily(id).notifier).visitStory();

    return state.when(
      data: (items) {
        final op = items.first;
        final comments = items.sublist(1);
        return ThreadContent(
          op: op,
          comments: comments,
          notifier: notifier,
        );
      },
      loading: () => const ThreadLoading(),
      error: (msg) => ThreadError(msg),
    );
  }
}

class ThreadError extends StatelessWidget {
  const ThreadError(
    this.message, {
    Key? key,
  }) : super(key: key);
  final String message;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(message)),
    );
  }
}

class ThreadLoading extends StatelessWidget {
  const ThreadLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class ThreadContent extends StatelessWidget {
  const ThreadContent({
    Key? key,
    required this.op,
    required this.comments,
    required this.notifier,
  }) : super(key: key);

  final FlatItemDetail op;
  final IList<FlatItemDetail> comments;
  final ItemDetailNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(op.title ?? ""),
        actions: [
          IconButton(
            onPressed: () {
              notifier.load();
            },
            icon: const Icon(Icons.refresh),
          ),
          if (op.url != null) ...[
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(op.url!));
              },
              icon: const Icon(Icons.open_in_new),
            ),
            IconButton(
              onPressed: () {
                Share.share(op.url!);
              },
              icon: const Icon(Icons.share),
            ),
          ]
        ],
      ),
      body: CustomScrollView(
        cacheExtent: 240,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  op.title ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text(op.author),
                    const Icon(
                      Icons.arrow_drop_up_sharp,
                      size: 24,
                      color: Colors.grey,
                    ),
                    Text((op.score ?? 0).toString()),
                    dotSeparator,
                    Text(
                      TimeElapsed.fromDateTime(op.createdAt),
                    ),
                  ],
                ),
                if (op.bodyData.isNotEmpty) Body(op.id, op.bodyData)
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final comment = comments[index];
                return CommentTile(
                    item: comment,
                    onCollapse: (int id) {
                      notifier.collapse(id);
                    });
              },
              childCount: comments.length,
            ),
          ),
        ],
      ),
    );
  }
}
