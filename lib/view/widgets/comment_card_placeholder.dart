import 'package:flutter/material.dart';

class CommentCardPlaceholder extends StatelessWidget {
  const CommentCardPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Container(
            color: Theme.of(context).colorScheme.surfaceVariant,
            height: 16,
            width: 64,
          ),
        ),
        for (var i = 0; i < 8; i++)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Container(
              color: Theme.of(context).colorScheme.surfaceVariant,
              height: 16,
              width: double.infinity,
            ),
          ),
      ],
    );
  }
}
