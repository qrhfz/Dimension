import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/view/pages/thread_page.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';

import '../../models/item.dart';
import '../providers/item_notifier.dart';
import 'comment_card_placeholder.dart';
import 'deleted_comment.dart';

class CommentCard extends ConsumerStatefulWidget {
  const CommentCard({
    Key? key,
    required this.id,
    this.level = 0,
  }) : super(key: key);

  final int id;
  final int level;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentCardState();
}

class _CommentCardState extends ConsumerState<CommentCard> {
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(itemFamily(widget.id));

    return GestureDetector(
      onTap: () {
        setState(() {
          hide = !hide;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(
          left: widget.level == 0 ? 8 : 16,
          bottom: 8,
          right: widget.level == 0 ? 8 : 0,
        ),
        child: state.maybeWhen(
          data: (item) {
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
  static const _maxLevel = 5;
  final hide;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Color(0xFFCCCCCC),
            width: 1,
          ),
        ),
      ),
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
            ],
          ),
          if (!hide) Body(comment.id, comment.body ?? ""),
          if (hide)
            const Text(
              "hidden",
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          const SizedBox(height: 8),
          if (level < _maxLevel &&
              comment.childrenIds != null &&
              comment.childrenIds!.isNotEmpty &&
              !hide)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: comment.childrenIds
                      ?.map((id) => CommentCard(
                            id: id,
                            level: level + 1,
                          ))
                      .toList() ??
                  [],
            ),
          if (level >= _maxLevel &&
              comment.childrenIds != null &&
              comment.childrenIds!.isNotEmpty)
            TextButton(
              onPressed: () {
                GoRouter.of(context).push(ThreadPage.routeBuilder(comment.id));
              },
              child: const Text("More comments"),
            )
        ],
      ),
    );
  }
}
