class Token {
  final TokenType type;
  final Object? value;

  Token(this.type, this.value);

  @override
  String toString() {
    return "<$type> : $value";
  }
}

enum TokenType { TEXT, CODE, P, ITALIC, LINK, PRE }
