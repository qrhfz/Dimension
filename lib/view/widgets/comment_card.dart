import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../providers/comments_notifier.dart';
import '../providers/item_notifier.dart';

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

        /// indent -1 because apparently Html() adds padding
        return Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 24 * (indent - 1),
            bottom: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Wrap(
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
              ),
              Html(data: item.body ?? "")
            ],
          ),
        );
      },
      orElse: () => Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 24 * (indent - 1),
          bottom: 64,
        ),
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
