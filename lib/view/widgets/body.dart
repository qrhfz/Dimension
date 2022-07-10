import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hn_client/util/decode_html.dart';
import 'package:hn_html_parser/token.dart';
import 'package:petitparser/parser.dart';
import 'package:hn_html_parser/hn_html_parser.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends ConsumerWidget {
  const Body(this.id, this.html, {Key? key}) : super(key: key);
  final String html;
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final tokens = ref.watch(tokenFamily(html));

    return BodyText(tokens: tokens);
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
  return TextSpan(children: children);
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
      return TextSpan(text: token.value.toString());
    case TokenType.ITALIC:
      return TextSpan(
        text: token.value.toString(),
        style: const TextStyle(fontStyle: FontStyle.italic),
      );
    case TokenType.LINK:
      final text = (token.value as List)[1];
      final url = (token.value as List)[0];
      return TextSpan(
        text: text,
        onEnter: (e) => log("enter"),
        style: const TextStyle(color: Colors.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () => launchUrl(Uri.parse(url)),

        /// hack to reduce recognizer width to minimum
        children: const [TextSpan(text: "\u200b")],
      );
    case TokenType.CODE:
      return TextSpan(
        text: token.value.toString(),
        style: const TextStyle(fontFamily: "monospace"),
      );
    default:
      return TextSpan(text: token.toString());
  }
}

final tokenFamily = Provider.family<List<Token>, String>((ref, html) {
  final parser = ref.read(parserProvider);
  final result = parser.parse(decodeHtml(html));

  if (result.isFailure) {
    return [];
  }
  final value = result.value as List;
  final List<Token> tokens = value.map((e) => e as Token).toList();
  return tokens;
});

final parserProvider = Provider<Parser>((ref) {
  final def = HnHtmlDefinition();
  final parser = def.build();
  return parser;
});
