import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hn_client/service/html_md_converter.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends ConsumerWidget {
  const Body(this.id, this.html, {Key? key}) : super(key: key);
  final String html;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final md = ref.watch(mdProvider(id));
    final mdNotifier = ref.read(mdProvider(id).notifier);
    mdNotifier.convert(html);

    return Markdown(
      padding: EdgeInsets.zero,
      data: md,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onTapLink: (_, url, __) {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
      },
    );
  }
}

final mdProvider = StateNotifierProvider.family<MDNotifier, String, int>(
    (ref, id) => MDNotifier(ref));

class MDNotifier extends StateNotifier<String> {
  final StateNotifierProviderRef ref;
  MDNotifier(this.ref) : super("");

  void convert(String html) async {
    final converter = ref.watch(htmlMDConverterProvider);
    final md = await converter.sendAndReceive(html);

    if (mounted) {
      state = md;
    }
  }
}
