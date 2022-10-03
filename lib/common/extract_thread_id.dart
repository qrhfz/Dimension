int? extractThreadId(String url) {
  final exp = RegExp(r'https?:\/\/news.ycombinator.com\/item\?id=(\d+)');
  final match = exp.firstMatch(url);

  if (match == null) {
    return null;
  }

  return int.tryParse(match.group(1) ?? "");
}
