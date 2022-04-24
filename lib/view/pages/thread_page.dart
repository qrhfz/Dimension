import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/providers/comments_notifier.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../widgets/comment_card.dart';

class ThreadPage extends ConsumerStatefulWidget {
  final Item? post;
  final int id;
  const ThreadPage(this.id, {this.post, Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends ConsumerState<ThreadPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(commentsNotifierProvider(widget.id).notifier);
    // notifier.rootID = widget.id;
    if (widget.post != null) {
      Future.delayed(Duration.zero, () async {
        notifier.seed(widget.post!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentsNotifierProvider(widget.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.post?.title ?? ""),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  widget.post?.title ?? "",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Row(
                  children: [
                    Text("${widget.post?.author}"),
                    const Icon(
                      Icons.arrow_drop_up_sharp,
                      size: 24,
                      color: Colors.grey,
                    ),
                    Text((widget.post?.score ?? 0).toString()),
                    dotSeparator,
                    Text(
                      TimeElapsed.fromDateTime(
                        widget.post?.createdAt ?? DateTime(0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (widget.post?.url != null)
                  PostURL(
                    post: widget.post!,
                  ),
                if (widget.post != null) Body(widget.post!.bodyData)
              ]),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final list = state.sortIndent(widget.post?.id ?? -1);
                return CommentCard(
                  id: list[index].id,
                  indent: list[index].indent,
                  rootID: widget.post?.id ?? -1,
                );
              },
              childCount: state.sortIndent(widget.post?.id ?? -1).length,
            ),
          ),
        ],
      ),
    );
  }
}

class PostURL extends StatelessWidget {
  const PostURL({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Item post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final url = post.url;
        if (url != null) {
          GoRouter.of(context).push('/browser', extra: url);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).hintColor,
            width: 0.5,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                post.url ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
      ),
    );
  }
}
