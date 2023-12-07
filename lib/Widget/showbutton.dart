// import 'package:flutter/material.dart';
//
// void showMyDialog(BuildContext context) {
//   String maritalstatus = "Google";
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text('Search Engine'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             RadioListTile(
//               value: "Google",
//               groupValue: maritalstatus,
//               onChanged: (value) {
//                 value.toString();
//               },
//               title: Text("Google"),
//             ),
//             RadioListTile(
//               value: "Yahoo",
//               groupValue: maritalstatus,
//               onChanged: (value) {},
//               title: Text("Yahoo"),
//             ),
//             RadioListTile(
//               value: "Bing",
//               groupValue: maritalstatus,
//               onChanged: (value) {},
//               title: Text("Bing"),
//             ),
//             RadioListTile(
//               value: "Duck Duck Go",
//               groupValue: maritalstatus,
//               onChanged: (value) {},
//               title: Text("Duck Duck Go"),
//             ),
//
//           ],
//         ),
//       );
//     },
//   );
// }
import 'package:flutter/material.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:provider/provider.dart';



void showMyDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Consumer<HomeProvider>(
        builder: (context, searchEngineProvider, _) {
          return AlertDialog(
            title: Text('Search Engine'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RadioListTile(
                  value: "Google",
                  groupValue: searchEngineProvider.maritalStatus,
                  onChanged: (value) {
                    searchEngineProvider.setMaritalStatus(value.toString());
                  },
                  title: Text("Google"),
                ),
                RadioListTile(
                  value: "Yahoo",
                  groupValue: searchEngineProvider.maritalStatus,
                  onChanged: (value) {
                    searchEngineProvider.setMaritalStatus(value.toString());
                  },
                  title: Text("Yahoo"),
                ),
                RadioListTile(
                  value: "Bing",
                  groupValue: searchEngineProvider.maritalStatus,
                  onChanged: (value) {
                    searchEngineProvider.setMaritalStatus(value.toString());
                  },
                  title: Text("Bing"),
                ),
                RadioListTile(
                  value: "Duck Duck Go",
                  groupValue: searchEngineProvider.maritalStatus,
                  onChanged: (value) {
                    searchEngineProvider.setMaritalStatus(value.toString());
                  },
                  title: Text("Duck Duck Go"),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
