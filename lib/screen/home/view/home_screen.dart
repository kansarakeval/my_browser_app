import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:my_browser_app/Widget/showbutton.dart';
import 'package:my_browser_app/Widget/showdilogbox.dart';
import 'package:my_browser_app/screen/home/provider/home_provider.dart';
import 'package:my_browser_app/util/network.dart';
import 'package:my_browser_app/util/shere_helper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  NetworkConnection networkConnection = NetworkConnection();
  HomeProvider? providerr;
  HomeProvider? providerw;
  static InAppWebViewController? inAppWebViewController;
  TextEditingController txtSearch = TextEditingController();
  double progressValue = 0.0;

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
          title: const Text(
            "My Browser",
            style: TextStyle(fontSize: 25),
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: GestureDetector(
                      onTap: () {
                        ShowdilogboxSheet(context);
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.bookmark),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "All Bookmarks",
                            style: TextStyle(fontSize: 15),
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
                      child: const Row(
                        children: [
                          Icon(Icons.screen_search_desktop_rounded),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Search Engine",
                            style: TextStyle(fontSize: 15),
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
        body: providerw!.isOnline
            ? Stack(
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
                setState(() {
                  progressValue = progress / 100;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 138,
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
                          icon: const Icon(Icons.search),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "search",
                      ),
                    ),
                    LinearProgressIndicator(
                      color: Colors.blue,
                      value: progressValue,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.loadUrl(
                                urlRequest: URLRequest(
                                  url: Uri.parse(
                                      "https://www.google.co.in/"),
                                ),
                              );
                            },
                            icon: const Icon(Icons.home_filled)),
                        IconButton(
                            onPressed: () async {
                              String uri = (await inAppWebViewController!.getUrl()).toString();
                              providerr!.bookMarkData!.add(uri);
                              ShareHelper sharHelper = ShareHelper();
                              await sharHelper.setBookMark(providerr!.bookMarkData!);
                              providerr!.getBookMark();
                            },
                            icon: const Icon(Icons.bookmark_add)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.goBack();
                            },
                            icon: const Icon(Icons.arrow_back_ios_new)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.reload();
                            },
                            icon: const Icon(Icons.refresh)),
                        IconButton(
                            onPressed: () {
                              inAppWebViewController!.goForward();
                            },
                            icon: const Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        )
            : const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage("asset/image/wifi.png"),
                width: 100,
                height: 100,
              ),
              Text(
                "No Network Connection",
                style: TextStyle(fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
