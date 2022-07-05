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
  static const colors = [
    Color.fromRGBO(74, 222, 128, 1),
    Color.fromRGBO(96, 165, 250, 1),
    Color.fromRGBO(129, 140, 248, 1),
    Color.fromRGBO(192, 132, 252, 1),
    Color.fromRGBO(248, 113, 113, 1),
    Color.fromRGBO(251, 146, 60, 1),
    Color.fromRGBO(250, 204, 21, 1),
  ];

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
        child: CommentContainer(
          child: state.maybeWhen(
            data: (item) {
              tree.addChildrenToId(item.childrenIds ?? [], item.id);
              if (item.isDeleted == true) {
                return const DeletedComment();
              }
              return CommentContent(
                comment: item,
                level: widget.level,
                hide: hide,
              );
            },
            orElse: () => const CommentCardPlaceholder(),
          ),
          leftPadding: leftPadding,
          level: widget.level,
        ));
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// author and comment info
        CommentInfo(comment: comment, hide: hide),
        if (!hide) Body(comment.id, comment.body ?? ""),
        const SizedBox(height: 8),
      ],
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

class CommentContainer extends StatelessWidget {
  const CommentContainer(
      {Key? key,
      required this.level,
      required this.leftPadding,
      required this.child})
      : super(key: key);
  final int level;
  final double leftPadding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        bottom: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: CommentTile.colors[level % CommentTile.colors.length],
              width: 3,
            ),
          ),
        ),
        padding: const EdgeInsets.all(8),
        child: child,
      ),
    );
  }
}
