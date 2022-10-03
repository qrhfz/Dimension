import 'dart:developer';

import 'package:dimension/common/extract_thread_id.dart';
import 'package:dimension/thread/comment/providers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../thread_page.dart';
import '/util/decode_html.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../html_parser/parser.dart';

class Body extends ConsumerWidget {
  const Body(this.id, this.html, {Key? key}) : super(key: key);
  final String html;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final tokens = ref.watch(tokenFamily(html));

    return BodyText(tokens: tokens);
    // return Text(html);
  }
}

class BodyText extends StatelessWidget {
  const BodyText({
    Key? key,
    required this.tokens,
  }) : super(key: key);

  final List<Token> tokens;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: RootTextSpan(tokens, context),
    );
  }
}

// ignore: non_constant_identifier_names
TextSpan RootTextSpan(List<Token> tokens, BuildContext context) {
  if (tokens.isEmpty) return const TextSpan();
  final List<InlineSpan> children = [];
  for (var i = 0; i < tokens.length; i++) {
    children.add(ChildTextSpan(tokens[i], context));
    if (i < tokens.length - 1) {
      children.add(const TextSpan(text: "\n\n"));
    }
  }
  return TextSpan(
    children: children,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}

// ignore: non_constant_identifier_names
InlineSpan ChildTextSpan(Token token, BuildContext context) {
  switch (token.type) {
    case TokenType.P:
      final List<Token> tokens =
          (token.value as List).map((e) => e as Token).toList();
      final List<InlineSpan> children = [];
      for (var i = 0; i < tokens.length; i++) {
        children.add(ChildTextSpan(tokens[i], context));
      }
      return TextSpan(children: children);
    case TokenType.TEXT:
      return TextSpan(text: decodeHtml(token.value.toString()));
    case TokenType.ITALIC:
      return TextSpan(
        text: decodeHtml(token.value.toString()),
        style: const TextStyle(fontStyle: FontStyle.italic),
      );
    case TokenType.LINK:
      final text = (token.value as List)[1];
      final url = (token.value as List)[0];
      return TextSpan(
        text: decodeHtml(text),
        onEnter: (e) => log("enter"),
        style: const TextStyle(color: Colors.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            final id = extractThreadId(url);
            if (id == null) {
              launchUrl(Uri.parse(decodeHtml(url)));
            } else {
              GoRouter.of(context).go(ThreadPage.routeBuilder(id));
            }
          },

        /// hack to reduce recognizer width to minimum
        children: const [TextSpan(text: "\u200b")],
      );
    case TokenType.CODE:
      return TextSpan(
        text: decodeHtml(token.value.toString()),
        style: const TextStyle(fontFamily: "monospace"),
      );
    case TokenType.PRE:
      return const TextSpan();
    default:
      return TextSpan(text: decodeHtml(token.toString()));
  }
}
