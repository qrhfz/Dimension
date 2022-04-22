import 'package:flutter_test/flutter_test.dart';
import 'package:hn_client/models/user.dart';

import '../dummy_objects.dart';

void main() {
  test("Given Map object fromJson should return User object", () {
    final User actual = User.fromJson(testJsonUser);
    expect(actual, testUser);
  });
}
