String? extractDomain(String url) {
  final pattern = RegExp(r'(?:[a-z]+:\/\/)([A-Za-z0-9-.]+)');
  final match = pattern.firstMatch(url);
  return match?.group(1);
}
