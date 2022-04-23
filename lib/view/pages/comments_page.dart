import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/comments_notifier.dart';

import '../../models/item.dart';
import '../providers/item_notifier.dart';

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
          SliverList(
            delegate: SliverChildListDelegate([
              Text(widget.post?.title ?? ""),
              Text(widget.post?.body ?? ""),
              Text(widget.post?.author ?? ""),
              const SizedBox(height: 8.0),
              const Text("Comments"),
              const SizedBox(height: 8.0)
            ]),
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

class CommentCard extends ConsumerWidget {
  const CommentCard({
    Key? key,
    required this.id,
    required this.indent,
  }) : super(key: key);

  final int id;
  final int indent;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemFamily(id));
    final commentPageNotifier = ref.read(commentsNotifierProvider.notifier);

    return state.maybeWhen(
      data: (item) {
        item.childrenIds?.forEach((element) {
          commentPageNotifier.addNode(Node(element, item.id));
        });

        return Padding(
          padding: EdgeInsets.only(left: indent * 12.0, bottom: 8.0),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.author),
                  Text(item.body ?? ""),
                ],
              ),
            ),
          ),
        );
      },
      orElse: () => Container(),
    );
  }
}
