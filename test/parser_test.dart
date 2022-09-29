import 'package:dimension/html_parser/hn_html_definition.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("parser", () {
    final def = HnHtmlDefinition();
    final parser = def.build();

    final res = parser.parse(
        """Adding that in HTML5, closing <p> <td> <th> <li> <dt> <dd> and other tags like these are optional. You can choose to not close those, and your HTML is just as valid.

If you practice not closing, you can do without any markdown language. As the HTML itself gets almost as simple as markdown. Plus, gives you advanced control not found in markdown. """);
    print(res.value);
    expect(res.isFailure, false);
  });
}
