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
    required this.id,
    required this.indent,
    required this.rootID,
    required this.hidden,
  }) : super(key: key);

  final int id;
  final int indent;
  final int rootID;
  final bool hidden;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemFamily(id));
    final thread = ref.read(commentsNotifierProvider(rootID).notifier);

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

    final leftPadding = 16.0 * (indent) + 8;
    const rightPadding = 8.0;

    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
        bottom: 8,
      ),
      child: state.maybeWhen(
        data: (item) {
          if (item.isDeleted == true) {
            return const Text("[deleted]");
          }
          if (hidden) {
            return CommentCardCollapsed(indent, item);
          }
          return CommentContent(
            indent: indent,
            item: item,
          );
        },
        orElse: () => const CommentCardPlaceholder(),
      ),
    );
  }
}

class CommentContent extends StatelessWidget {
  const CommentContent({
    Key? key,
    required this.item,
    required this.indent,
  }) : super(key: key);

  final int indent;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: [
            Text(
              item.author,
              style: Theme.of(context).textTheme.labelLarge,
            ),
            dotSeparator,
            Text(
              TimeElapsed.fromDateTime(item.createdAt),
            ),
          ],
        ),
        Body(item.id, item.bodyData),
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

class CommentCardCollapsed extends StatelessWidget {
  const CommentCardCollapsed(this.indent, this.item, {Key? key})
      : super(key: key);
  final int indent;
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          item.author,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        dotSeparator,
        Text(
          TimeElapsed.fromDateTime(item.createdAt),
        ),
        const Text("  [collapsed]")
      ],
    );
  }
}
