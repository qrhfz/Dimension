import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/comments_notifier.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/item_notifier.dart';
import '../widgets/comment_card.dart';

class CommentsPage extends ConsumerStatefulWidget {
  final Item? post;
  final int id;
  const CommentsPage(this.id, {this.post, Key? key}) : super(key: key);

  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends ConsumerState<CommentsPage> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(commentsNotifierProvider.notifier);
    notifier.rootID = widget.id;
    if (widget.post != null) {
      Future.delayed(Duration.zero, () async {
        notifier.seed(widget.post!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentsNotifierProvider);

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
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text("${widget.post?.author}"),
                    const Icon(
                      Icons.arrow_drop_up_sharp,
                      size: 24,
                      color: Colors.grey,
                    ),
                    Text((widget.post?.score ?? 0).toString()),
                    const SizedBox(width: 8),
                    Text(
                      TimeElapsed.fromDateTime(
                        widget.post?.createdAt ?? DateTime(0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (widget.post?.body != null)
                  Container(
                    color: Colors.grey.shade200,
                    child: Html(data: widget.post?.body ?? ""),
                  ),
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
                );
              },
              childCount: state.sortIndent(widget.post?.id ?? -1).length,
            ),
          )
        ],
      ),
    );
  }
}
