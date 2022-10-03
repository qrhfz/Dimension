import 'package:petitparser/petitparser.dart' as pp;
import '../../html_parser/parser.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tokenFamily = Provider.family<List<Token>, String>((ref, html) {
  final parser = ref.read(parserProvider);
  final result = parser.parse(html);

  if (result.isFailure) {
    return [];
  }
  final tokens = (result.value as List).cast<Token>();

  return tokens;
});

final parserProvider = Provider<pp.Parser>((ref) {
  final def = HnHtmlDefinition();
  final parser = def.build();
  return parser;
});
