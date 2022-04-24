import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/comments_notifier.dart';
import '../widgets/body.dart';
import '../widgets/comment_card.dart';
import '../widgets/dot_separator.dart';

class CommentPage extends ConsumerStatefulWidget {
  final Item parent;
  const CommentPage({required this.parent, Key? key}) : super(key: key);

  @override
  _CommentPageState createState() => _CommentPageState();
}

class _CommentPageState extends ConsumerState<CommentPage> {
  @override
  void initState() {
    super.initState();
    final notifier =
        ref.read(commentsNotifierProvider(widget.parent.id).notifier);

    Future.delayed(Duration.zero, () async {
      notifier.seed(widget.parent);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentsNotifierProvider(widget.parent.id));

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.parent.title ?? ""),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Row(
                  children: [
                    Text(
                      widget.parent.author,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    dotSeparator,
                    Text(
                      TimeElapsed.fromDateTime(
                        widget.parent.createdAt,
                      ),
                    ),
                  ],
                ),
                if (widget.parent.body != null) Body(widget.parent.body ?? "")
              ]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final list = state.sortIndent(widget.parent.id);
                  return CommentCard(
                    id: list[index].id,
                    indent: list[index].indent,
                    rootID: widget.parent.id,
                  );
                },
                childCount: state.sortIndent(widget.parent.id).length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
