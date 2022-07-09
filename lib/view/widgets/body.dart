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

    return RichText(text: rootTextSpan(tokens, context));
  }
}

TextSpan rootTextSpan(List<Token> tokens, BuildContext context) {
  if (tokens.isEmpty) {
    return const TextSpan();
  }
  TextStyle style = TextStyle(
    color: Theme.of(context).colorScheme.onSurface,
  );

  final List<InlineSpan> children =
      tokens.sublist(1).map((e) => genTextSpan(e, context)).toList();
  final token = tokens.first;
  switch (token.type) {
    case TokenType.P:
      return TextSpan(
        text: "\n\n",
        children: children,
        style: style,
      );

    case TokenType.ITALIC:
      return TextSpan(
        text: token.value.toString(),
        children: children,
        style: style.copyWith(fontStyle: FontStyle.italic),
      );
    case TokenType.TEXT:
      return TextSpan(
        text: token.value.toString(),
        children: children,
        style: style,
      );
    case TokenType.CODE:
      return TextSpan(
        text: token.value.toString(),
        children: children,
        style: style.copyWith(fontFamily: "monospace"),
      );
    case TokenType.LINK:
      return TextSpan(
          text: (token.value as List)[1].toString(),
          children: children,
          style: style.copyWith(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse((token.value as List)[0].toString()));
            });
    case TokenType.PRE:
      return TextSpan(children: children);
  }
}

InlineSpan genTextSpan(Token token, BuildContext context) {
  TextStyle style = TextStyle(
    color: Theme.of(context).colorScheme.onSurface,
  );

  switch (token.type) {
    case TokenType.P:
      return TextSpan(
        text: "\n\n",
        style: style,
      );

    case TokenType.ITALIC:
      return TextSpan(
        text: token.value.toString(),
        style: style.copyWith(fontStyle: FontStyle.italic),
      );
    case TokenType.TEXT:
      return TextSpan(
        text: token.value.toString(),
        style: style,
      );
    case TokenType.CODE:
      return TextSpan(
        text: token.value.toString(),
        style: style.copyWith(fontFamily: "monospace"),
      );
    case TokenType.LINK:
      return TextSpan(
          text: (token.value as List)[1].toString(),
          style: style.copyWith(color: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              launchUrl(Uri.parse((token.value as List)[0].toString()));
            });
    case TokenType.PRE:
      return const TextSpan();
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
