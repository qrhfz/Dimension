String decodeHtml(String html) {
  final map = {
    "&#x27;": "'",
    "&#x2F;": "/",
    "&#34;": '"',
    "&quot;": '"',
    "&lt;": "<",
    "&gt;": ">",
    "&amp;": "&"
  };

  for (var x in map.entries) {
    html = html.replaceAll(x.key, x.value);
  }

  return html;
}
