import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/item_tree_notifier.dart';
import 'package:hn_client/view/providers/item_notifier.dart';

import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../providers/story_notifier.dart';
import '../widgets/comment_tile.dart';

class ThreadPage extends ConsumerWidget {
  static String routeBuilder(int id) => "/item?id=$id";

  final int id;
  const ThreadPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(itemFamily(id));

    final childrenIdList = ref.watch(itemTreeFamily(id));
    ref.read(storyFamily(id).notifier).visitStory();

    return state.maybeWhen(
      data: (item) => Scaffold(
        appBar: AppBar(
          title: Text(item.title ?? ""),
          actions: state.maybeWhen(
              data: (item) {
                final url = item.url;
                if (url == null) return null;
                return [
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(url));
                    },
                    icon: const Icon(Icons.open_in_new),
                  )
                ];
              },
              orElse: () => null),
        ),
        body: CustomScrollView(
          cacheExtent: 240,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Text(
                    item.title ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Row(
                    children: [
                      Text(item.author),
                      const Icon(
                        Icons.arrow_drop_up_sharp,
                        size: 24,
                        color: Colors.grey,
                      ),
                      Text((item.score ?? 0).toString()),
                      dotSeparator,
                      Text(
                        TimeElapsed.fromDateTime(item.createdAt),
                      ),
                    ],
                  ),
                  if (item.bodyData.isNotEmpty) Body(item.id, item.bodyData)
                ]),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final child = childrenIdList[index];
                  return CommentTile(
                    rootId: item.id,
                    listIdItem: child,
                  );
                },
                childCount: childrenIdList.length,
              ),
            ),
          ],
        ),
      ),
      orElse: () => const Scaffold(
        body: SafeArea(child: CircularProgressIndicator()),
      ),
    );
  }
}
