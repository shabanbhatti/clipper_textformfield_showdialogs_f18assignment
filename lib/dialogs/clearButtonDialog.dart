import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void clearButton({required BuildContext context}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Icon(
          Icons.done,
          color: Colors.green,
          size: 50,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cleared',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
      );
    },
  );
}
