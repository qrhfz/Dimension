import 'package:flutter/material.dart';

class DeletedComment extends StatelessWidget {
  const DeletedComment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          SizedBox(
            width: 32,
            height: 32,
            child: Center(
              child: Icon(
                Icons.delete,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            "Deleted Comment",
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
