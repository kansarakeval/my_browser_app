import 'package:flutter/material.dart';

void ShowdilogboxSheet(BuildContext context)
{
  showModalBottomSheet(context: context, builder: (context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => const SizedBox(
        height: 700,
        child: Column(
          children: [
            SizedBox(height: 50,),
          ],
        ),
      ),
    );
  },);
}