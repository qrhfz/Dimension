import 'package:dimension/common/extract_domain.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("given a valid url return domain name", () {
    const url =
        "https://stackoverflow.com/questions/38908285/how-do-i-add-methods-or-values-to-enums-in-dart";

    final domain = extractDomain(url);

    expect(domain, "stackoverflow.com");
  });
}
