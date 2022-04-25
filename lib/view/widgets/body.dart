import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';
import 'package:html2md/html2md.dart' as html2md;
import 'package:flutter_markdown/flutter_markdown.dart';

class Body extends StatefulWidget {
  const Body(this.data, {Key? key}) : super(key: key);
  final String data;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String md = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      md = html2md.convert(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
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
