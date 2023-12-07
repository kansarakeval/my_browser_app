import 'package:flutter/material.dart';

void showMyDialog(BuildContext context) {
  String maritalstatus = "Google";
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Search Engine'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              value: "Google",
              groupValue: maritalstatus,
              onChanged: (value) {},
              title: Text("Google"),
            ),
            RadioListTile(
              value: "Yahoo",
              groupValue: maritalstatus,
              onChanged: (value) {},
              title: Text("Yahoo"),
            ),
            RadioListTile(
              value: "Bing",
              groupValue: maritalstatus,
              onChanged: (value) {},
              title: Text("Bing"),
            ),
            RadioListTile(
              value: "Duck Duck Go",
              groupValue: maritalstatus,
              onChanged: (value) {},
              title: Text("Duck Duck Go"),
            ),

          ],
        ),
      );
    },
  );
}
