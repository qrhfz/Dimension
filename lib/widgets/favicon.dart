import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/extract_domain.dart';

class Favicon extends StatelessWidget {
  const Favicon(this.url, {Key? key}) : super(key: key);

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url != null) {
      return CachedNetworkImage(
        imageUrl: "https://${extractDomain(url!)}/favicon.ico",
        errorWidget: (ctx, s, _) {
          return const Icon(Icons.link_rounded, size: 16);
        },
        placeholder: (ctx, s) {
          return const Icon(Icons.link_rounded, size: 16);
        },
      );
    }
    return const Icon(Icons.link_rounded, size: 16);
  }
}
