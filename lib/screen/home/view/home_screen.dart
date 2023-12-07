import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_browser_app/Widget/alter_widget.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:my_browser_app/util/network.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkConnection networkConnection = NetworkConnection();
  HomeProvider? providerr;
  HomeProvider? providerw;
  InAppWebViewController? inAppWebViewController;
  TextEditingController txtSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
    networkConnection.checkConnection(context);
  }
  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
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
                        // showMyDialog(context);
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
        body: providerw!.isOnline ? Stack(
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
                      controller: txtSearch,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            inAppWebViewController?.loadUrl(
                              urlRequest: URLRequest(
                                url: Uri.parse(
                                    "https://www.google.com/search?q=${txtSearch.text}"),
                              ),
                            );
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
        )
            :Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("asset/image/wifi.png"),
                width: 100,
                height: 100,
              ),
              Text(
                "no Network connection",
                style: (TextStyle(fontSize: 20)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
