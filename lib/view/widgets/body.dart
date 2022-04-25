import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hn_client/service/html_md_converter.dart';

class Body extends ConsumerWidget {
  const Body(this.id, this.html, {Key? key}) : super(key: key);
  final String html;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final converter = ref.watch(htmlMDConverterProvider);
    final md = ref.watch(mdProvider(id));
    final mdNotifier = ref.read(mdProvider(id).notifier);
    converter.sendAndReceive(html).then((md) {
      mdNotifier.state = md;
    });

    return Markdown(
      padding: EdgeInsets.zero,
      data: md,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onTapLink: (_, url, __) {
        if (url != null) {
          GoRouter.of(context).push("/browser", extra: url);
        }
      },
    );
  }
}

final mdProvider = StateProviderFamily<String, int>((ref, id) => "");
