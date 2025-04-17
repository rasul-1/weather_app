import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, String errormessage) {
  if (!Platform.isIOS) {
    showCupertinoDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: [
            CupertinoDialogAction(
              child: const Text('ok'),
              onPressed: () {
                Navigator.pop(context);
              } ,
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ERROR'),
          content: Text(errormessage),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      },
    );
  }
}
