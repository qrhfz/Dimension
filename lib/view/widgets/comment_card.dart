import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/providers/item_state.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/comments_notifier.dart';
import '../providers/item_notifier.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    Key? key,
    required this.comment,
    required this.rootID,
    required this.onHide,
  }) : super(key: key);

  final Node comment;
  final int rootID;
  final Function() onHide;

  @override
  Widget build(BuildContext context, ref) {
    final id = comment.id;
    final indent = comment.indent;
    final hidden = comment.hidden;

    final state = ref.watch(itemFamily(id));

    final thread = ref.read(commentsNotifierProvider(rootID).notifier);
    ref.listen(itemFamily(id), (_, ItemState state) {
      state.maybeWhen(
        data: (item) {
          if (indent >= 4) return;
          item.childrenIds?.forEach((element) {
            scheduleMicrotask(() {
              thread.addNode(Node(id: element, parent: item.id));
            });
          });
        },
        orElse: () {},
      );
    });

    final leftPadding = 32.0 * (indent);

    return Padding(
      padding: EdgeInsets.only(bottom: 8, left: leftPadding),
      child: state.maybeWhen(
        data: (item) {
          if (item.isDeleted == true) {
            return const DeletedComment();
          }
          return CommentContent(
            indent: indent,
            item: item,
            hidden: hidden,
            onHide: onHide,
          );
        },
        orElse: () => const CommentCardPlaceholder(),
      ),
    );
  }
}

class DeletedComment extends StatelessWidget {
  const DeletedComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: const [
        SizedBox(
          width: 32,
          height: 32,
          child: Center(
            child: Icon(
              Icons.delete,
              color: Colors.black54,
            ),
          ),
        ),
        Text(
          "Deleted post.",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}

class CommentContent extends StatelessWidget {
  const CommentContent({
    Key? key,
    required this.item,
    required this.indent,
    required this.hidden,
    required this.onHide,
  }) : super(key: key);

  final int indent;
  final Item item;
  final bool hidden;
  final Function() onHide;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: onHide,
              child: hidden
                  ? const Icon(Icons.expand_more, size: 32)
                  : const Icon(Icons.expand_less, size: 32),
            ),
            Text(
              item.author,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            dotSeparator,
            Text(
              TimeElapsed.fromDateTime(item.createdAt),
            ),
            if (item.isDead ?? false)
              const Text(
                "  dead post",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
          ],
        ),
        if (!hidden)
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Body(item.id, item.body ?? ""),
          ),
        if (indent == 4 && (item.childrenIds?.isNotEmpty ?? false))
          TextButton(
            child: const Text("more reply"),
            onPressed: () {
              GoRouter.of(context).push("/comment", extra: item);
            },
          )
      ],
    );
  }
}

class CommentCardPlaceholder extends StatelessWidget {
  const CommentCardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Colors.grey.shade300,
            height: 8,
            width: 64,
          ),
        ),
        for (var i = 0; i < 5; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              color: Colors.grey.shade300,
              height: 8,
              width: double.infinity,
            ),
          ),
      ],
    );
  }
}
