import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body(this.data, {Key? key}) : super(key: key);
  final String data;

  @override
  Widget build(BuildContext context) {
    return Html(
      data: data,
      style: {
        "body": Style(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
        )
      },
      onAnchorTap: (url, ctx, _, element) {
        if (url != null) {
          GoRouter.of(context).push("/browser", extra: url);
        }
      },
    );
  }
}
