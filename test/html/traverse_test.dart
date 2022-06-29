import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

void main() {
  const html = """
  <i>Italic</i><p>paragraph <a href="https://example.com" rel="nofollow">link.</a></p><code>code block</code>
  """;

  final document = parse(html);
  final body = document.querySelector("body");

  void traverseDOM(Element el, [int depth = 0]) {
    log((" " * depth) + (el.localName ?? ""));
    for (var element in el.children) {
      traverseDOM(element, depth + 1);
    }
  }

  traverseDOM(body!);

  test("html testing", () {});
}
