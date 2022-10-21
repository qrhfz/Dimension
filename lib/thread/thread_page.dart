import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../common/time_converter.dart';
import '/models/item_detail.dart';

import '/thread/comment/body.dart';
import '/widgets/dot_separator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../item/item_detail/item_detail_notifier.dart';
import '../item/visit_notifier.dart';
import 'comment/comment_tile.dart';

class ThreadPage extends ConsumerWidget {
  static String routeBuilder(int id) => "/item?id=$id";

  final int id;
  const ThreadPage(this.id, {super.key});

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemDetailFamily(id));
    final notifier = ref.watch(itemDetailFamily(id).notifier);
    ref.watch(visitationFamily(id).notifier).visitStory();

    void refresh() {
      notifier.load();
    }

    void collapseComment(int id) {
      notifier.collapse(id);
    }

    return state.when(
      data: (items) {
        final op = items.first;
        final comments = items.sublist(1);
        return ThreadContent(
          op: op,
          comments: comments,
          refresh: refresh,
          collapseComment: collapseComment,
        );
      },
      error: (msg) => ThreadError(msg, refresh: refresh),
      loading: () => const ThreadLoading(),
    );
  }
}

class ThreadError extends StatelessWidget {
  const ThreadError(
    this.message, {
    required this.refresh,
    super.key,
  });
  final String message;
  final Function() refresh;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(child: Text(message)),
    );
  }
}

class ThreadLoading extends StatelessWidget {
  const ThreadLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

class ThreadContent extends StatelessWidget {
  const ThreadContent(
      {required this.op,
      required this.comments,
      required this.refresh,
      required this.collapseComment,
      super.key});

  final FlatItemDetail op;
  final IList<FlatItemDetail> comments;
  final Function() refresh;
  final Function(int) collapseComment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(op.title ?? ""),
        actions: [
          IconButton(
            onPressed: refresh,
            icon: const Icon(Icons.refresh),
          ),
          if (op.url != null) ...[
            IconButton(
              onPressed: () {
                launchUrl(Uri.parse(op.url!),
                    mode: LaunchMode.externalApplication);
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
      body: RefreshIndicator(
        onRefresh: () async => refresh(),
        child: CustomScrollView(
          cacheExtent: 240,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  if (op.title != null && op.title!.isNotEmpty)
                    Text(
                      op.title!,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  if (op.storyId != null)
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.cyan.shade200),
                        color: Colors.cyan.shade50,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Text(
                          "Read the whole story",
                          style: TextStyle(
                            color: Colors.cyan.shade900,
                          ),
                        ),
                        onTap: () {
                          final id = op.storyId;
                          if (id == null) return;
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (_) => ThreadPage(id),
                          //   ),
                          // );
                          GoRouter.of(context)
                              .push(ThreadPage.routeBuilder(id));
                        },
                      ),
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
                        formatTime(op.createdAt),
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
                    onCollapse: collapseComment,
                  );
                },
                childCount: comments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
