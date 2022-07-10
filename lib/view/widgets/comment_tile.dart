import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/models/item_detail.dart';
import 'package:hn_client/models/tree_id_item.dart';
import 'package:hn_client/view/providers/item_tree_notifier.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/item_notifier.dart';
import 'comment_card_placeholder.dart';
import 'deleted_comment.dart';

class CommentTile extends ConsumerWidget {
  const CommentTile({
    Key? key,
    required this.item,
    required this.onCollapse,
  }) : super(key: key);

  final FlatItemDetail item;
  final void Function(int id) onCollapse;
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
  Widget build(BuildContext context, ref) {
    final id = item.id;
    final level = item.level;
    // final collapsed = item.collapsed;

    final leftPadding = 16.0 * (level) - 8.0;

    return GestureDetector(
      onTap: () {
        onCollapse(id);
      },
      child: CommentContainer(
        child: CommentContent(item),
        leftPadding: leftPadding,
        level: level,
      ),
    );
  }
}

class CommentContent extends StatelessWidget {
  const CommentContent(this.item, {Key? key}) : super(key: key);

  final FlatItemDetail item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        /// author and comment info
        CommentInfo(comment: item),
        if (!item.collapsed && item.body != null) Body(item.id, item.body!),
        const SizedBox(height: 8),
      ],
    );
  }
}

class CommentInfo extends StatelessWidget {
  const CommentInfo({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final FlatItemDetail comment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          comment.author,
        ),
        dotSeparator,
        Text(
          TimeElapsed.fromDateTime(comment.createdAt),
        ),
        if (comment.collapsed) const Icon(Icons.expand_more, size: 16)
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
