import 'package:flutter/material.dart';
import 'package:pe_food_app/common/fonts.dart';

class AlertPopup {
  AlertPopup.error(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text('Error', style: TextStyle(fontWeight: FontWeight.bold)),
              content: Text(message, style: Fonts.sb16),
              actions: [TextButton(onPressed: () => Navigator.pop(ctx), child: const Text('OK'))],
            ));
  }
}
