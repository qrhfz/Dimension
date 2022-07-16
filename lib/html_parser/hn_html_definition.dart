import 'package:petitparser/definition.dart';
import 'package:petitparser/parser.dart';

import 'token.dart';

class HnHtmlDefinition extends GrammarDefinition {
  @override
  Parser start() => ref0(element).starLazy(endOfInput());

  // Parser values() => ref0(value);
  Parser element() => ref0(paragraph) | ref0(atom);

  Parser text() => any()
      .starLazy(ref0(simple) | string("<p>") | string("</p>") | endOfInput())
      .flatten()
      .map((value) => Token(TokenType.TEXT, value));

  Parser paragraph() => (string("<p>") &
          ref0(atom).starLazy(string("</p>") | endOfInput()) &
          string("</p>"))
      .map((value) => Token(TokenType.P, value[1]));

  Parser atom() => ref0(simple) | ref0(text);

  Parser simple() => ref0(pre) | ref0(code) | ref0(italic) | ref0(link);

  Parser italic() => ref1(tag, "i").map(
        (value) => Token(TokenType.ITALIC, value),
      );

  Parser pre() => (string("<pre>") | string("</pre>"))
      .map((value) => Token(TokenType.PRE, null));

  Parser code() => ref1(tag, "code").map(
        (value) => Token(TokenType.CODE, value),
      );

  Parser link() {
    return ((string('<a href="') & ref0(linkHref) & string('" rel="nofollow">'))
                .pick(1) &
            (ref0(linkName) & string('</a>')).pick(0))
        .map((value) => Token(TokenType.LINK, value));
  }

  Parser linkHref() =>
      any().starLazy(string('" rel="nofollow">')).flatten().trim();

  Parser linkName() => any().starLazy(string('</a>')).flatten().trim();

  Parser tag(String tag) =>
      (string('<$tag>') & ref1(innerTag, tag) & string('</$tag>'))
          .map((value) => value[1]);

  Parser innerTag(String tag) =>
      any().starLazy(string("</$tag>")).flatten().trim();
}
