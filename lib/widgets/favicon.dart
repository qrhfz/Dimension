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
          return const FaviconPlaceholder();
        },
        placeholder: (ctx, s) {
          return const FaviconPlaceholder();
        },
      );
    }
    return const FaviconPlaceholder();
  }
}

class FaviconPlaceholder extends StatelessWidget {
  const FaviconPlaceholder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.link_rounded,
      size: 16,
      color: Colors.grey.shade700,
    );
  }
}
