import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hn_client/service/html_md_converter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html2md/html2md.dart';

class Body extends ConsumerWidget {
  const Body(this.id, this.html, {Key? key}) : super(key: key);
  final String html;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    return Markdown(
      styleSheet: MarkdownStyleSheet(
        blockquoteDecoration: BoxDecoration(
          color:
              Theme.of(context).cardTheme.color ?? Theme.of(context).cardColor,
          border: const Border(
            left: BorderSide(
              width: 3,
              color: Color.fromRGBO(202, 138, 4, 1.0),
            ),
          ),
        ),
      ),
      padding: EdgeInsets.zero,
      data: convert(html),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onTapLink: (_, url, __) {
        if (url != null) {
          launchUrl(Uri.parse(url));
        }
      },
    );

    // return Text(html);
  }
}
