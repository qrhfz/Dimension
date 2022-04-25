import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hn_client/service/html_md_converter.dart';

class Body extends ConsumerWidget {
  const Body(this.data, {Key? key}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context, ref) {
    final converter = ref.watch(htmlMDConverterProvider);
    return FutureBuilder<String>(
      future: converter.sendAndReceive(data),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            padding: EdgeInsets.zero,
            data: snapshot.data ?? "",
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            onTapLink: (_, url, __) {
              if (url != null) {
                GoRouter.of(context).push("/browser", extra: url);
              }
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
