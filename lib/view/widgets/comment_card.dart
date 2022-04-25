import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../providers/comments_notifier.dart';
import '../providers/item_notifier.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    Key? key,
    required this.id,
    required this.indent,
    required this.rootID,
  }) : super(key: key);

  final int id;
  final int indent;
  final int rootID;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemFamily(id));

    final leftPadding = 16.0 * (indent - 1) + 8;
    const rightPadding = 8.0;

    return Padding(
      padding: EdgeInsets.only(
        left: leftPadding,
        right: rightPadding,
        bottom: 8,
      ),
      child: state.maybeWhen(
        data: (item) {
          if (indent < 5) {
            // comment with depth of 5 or more doesn't need to check their children
            item.childrenIds?.forEach((element) {
              // add delay so flutter doesn't throw error
              final notifier =
                  ref.read(commentsNotifierProvider(rootID).notifier);
              // add each child to the ancestor
              notifier.addNode(Node(element, item.id));
            });
          }
          if (item.isDeleted == true) {
            return const Text("[deleted]");
          }
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
              Body(item.bodyData),
              if (indent == 5 && (item.childrenIds?.isNotEmpty ?? false))
                TextButton(
                  child: const Text("more reply"),
                  onPressed: () {
                    GoRouter.of(context).push("/comment", extra: item);
                  },
                )
            ],
          );
        },
        orElse: () => const CommentCardPlaceholder(),
      ),
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
