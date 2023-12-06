import 'package:flutter/material.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('My Dialog'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
              title: Text("Single"),
            ),
            RadioListTile(
              value: 1,
              groupValue: 1,
              onChanged: (value) {},
              title: Text("Married"),
            ),
          ],
        ),
      );
    },
  );
}
