import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hn_client/view/providers/item_notifier.dart';
import 'package:hn_client/view/providers/item_state.dart';
import 'package:hn_client/view/widgets/body.dart';
import 'package:hn_client/view/widgets/dot_separator.dart';
import 'package:time_elapsed/time_elapsed.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/comment_card.dart';

class ThreadPage extends ConsumerStatefulWidget {
  static String routeBuilder(int id) => "/thread/$id";

  final int id;
  const ThreadPage(this.id, {Key? key}) : super(key: key);

  @override
  ConsumerState<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends ConsumerState<ThreadPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch<ItemState>(itemFamily(widget.id));

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
          cacheExtent: 2000,
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
                  final commentId = item.childrenIds![index];
                  return CommentCard(id: commentId);
                },
                childCount: item.childrenIds?.length ?? 0,
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
