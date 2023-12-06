// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "My Browser",
//             style: TextStyle(
//               fontSize: 25,
//               fontWeight: FontWeight.bold
//             ),
//           ),
//           centerTitle: true,
//           actions: [
//             PopupMenuButton(
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(
//                     child: Row(
//                       children: [
//                         Icon(Icons.bookmark),
//                         SizedBox(width: 10,),
//                         Text(
//                           "All Bookmarks",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                   PopupMenuItem(
//                     child: Row(
//                       children: [
//                         Icon(Icons.screen_search_desktop_rounded),
//                         SizedBox(width: 10,),
//                         Text(
//                           "Search Engine",
//                           style: TextStyle(fontSize: 20),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ];
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_browser_app/Widget/alter_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  InAppWebViewController? inAppWebViewController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Browser",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        showMyDialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "All Bookmarks",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        showMyDialog(context);
                      },
                      child: Row(
                        children: [
                          Icon(Icons.screen_search_desktop_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search Engine",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse("https://www.google.co.in/"),
              ),
              onLoadStart: (controller, url) {
                inAppWebViewController = controller;
              },
              onLoadStop: (controller, url) {
                inAppWebViewController = controller;
              },
              onLoadError: (controller, url, code, message) {
                inAppWebViewController = controller;
              },
              onProgressChanged: (controller, progress) {
                inAppWebViewController = controller;
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(10),
                height: 140,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                          },
                          icon: Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "search",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.loadUrl(
                                  urlRequest: URLRequest(
                                      url: Uri.parse(
                                          "https://www.google.co.in/")));
                            },
                            icon: Icon(Icons.home_filled)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.bookmark_add)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.goBack();
                            },
                            icon: Icon(Icons.arrow_back_ios_new)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.reload();
                            },
                            icon: Icon(Icons.refresh)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.goForward();
                            },
                            icon: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
