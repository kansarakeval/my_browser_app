import 'package:flutter/material.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

void ShowdilogboxSheet(BuildContext context)
{
  showModalBottomSheet(context: context, builder: (context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) =>  SizedBox(
        height: 700,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Text(" ${context.read<HomeProvider>().bookMarkData![index]}")
                ],
              ),
            );
          },
          itemCount: context.read<HomeProvider>().bookMarkData!.length,
        ),
      ),
    );
  },);
}