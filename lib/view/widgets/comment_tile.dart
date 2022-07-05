import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/item_descendant_notifier.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/item_notifier.dart';
import 'comment_card_placeholder.dart';
import 'deleted_comment.dart';

class CommentTile extends ConsumerStatefulWidget {
  const CommentTile({
    Key? key,
    required this.id,
    required this.rootId,
    this.level = 0,
  }) : super(key: key);

  final int id;
  final int level;
  final int rootId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentCardState();
}

class _CommentCardState extends ConsumerState<CommentTile> {
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemFamily(widget.id));
    final tree = ref.read(itemDescendantProvider(widget.rootId).notifier);
    final leftPadding = 16.0 * (widget.level);
    return GestureDetector(
      onTap: () {
        setState(() {
          hide = !hide;
          tree.collapseId(widget.id);
        });
      },
      child: state.maybeWhen(
        data: (item) {
          tree.addChildrenToId(item.childrenIds ?? [], item.id);
          if (item.isDeleted == true) {
            return Padding(
              padding: EdgeInsets.only(left: leftPadding),
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: Color(0xFFD1D5DB),
                      width: 1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(8),
                child: const DeletedComment(),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: leftPadding),
            child: CommentContent(
              comment: item,
              level: widget.level,
              hide: hide,
            ),
          );
        },
        orElse: () => const CommentCardPlaceholder(),
      ),
    );
  }
}

class CommentContent extends StatelessWidget {
  const CommentContent(
      {Key? key,
      required this.comment,
      required this.level,
      required this.hide})
      : super(key: key);

  final Item comment;
  final int level;
  static const maxLevel = 5;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xFFD1D5DB),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          /// author and comment info
          CommentInfo(comment: comment, hide: hide),
          if (!hide) Body(comment.id, comment.body ?? ""),
          const SizedBox(height: 8),
          // if (!hide) ChildrenComment(comment: comment, level: level),
        ],
      ),
    );
  }
}

class CommentInfo extends StatelessWidget {
  const CommentInfo({
    Key? key,
    required this.comment,
    required this.hide,
  }) : super(key: key);

  final Item comment;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          comment.author,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        dotSeparator,
        Text(
          TimeElapsed.fromDateTime(comment.createdAt),
        ),
        if (comment.isDead ?? false)
          const Text(
            "  dead post",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        if (hide) const Icon(Icons.expand_more, size: 16)
      ],
    );
  }
}
