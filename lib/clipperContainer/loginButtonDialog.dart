import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void loginButtonDialog({required BuildContext context}) {
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
              'Login Successful',
              style: TextStyle(color: Colors.green, fontSize: 15),
            ),
          ],
        ),
      );
    },
  );
}

void elseLoginButtonDialog({required BuildContext context}) {
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: Colors.red,
              size: 50,
            ),
            Text(
              'Error',
              style: TextStyle(
                  color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            )
          ],
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Something went wrong',
              style: TextStyle(color: Colors.red, fontSize: 15),
            ),
          ],
        ),
      );
    },
  );
}
