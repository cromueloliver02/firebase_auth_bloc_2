import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

void showErrorMessageDialog(BuildContext ctx, CustomError err) {
  if (Platform.isIOS) {
    showCupertinoDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(err.code),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(err.plugin),
            Text(err.message),
          ],
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  if (Platform.isAndroid) {
    showDialog(
      context: ctx,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(err.code),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(err.plugin, textAlign: TextAlign.left),
            const SizedBox(height: 5),
            Text(err.message, textAlign: TextAlign.left),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }
}
