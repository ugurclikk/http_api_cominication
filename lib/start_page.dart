import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'http_request.dart';
import 'news_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var controller = Get.put(Getclass());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daily News!"),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: FutureBuilder(
        future: getRequest(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData == true) {
                  //print(snapshot.data["articles"][index]["urlToImage"]);
                  return TextButton(
                    onPressed: () {
                      controller.updatedata(
                          snapshot.data["articles"][index]["title"],
                          snapshot.data["articles"][index]["content"],
                          snapshot.data["articles"][index]["urlToImage"]);
                      Get.to(const NewsPage());
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(snapshot.data["articles"][index]["title"]),
                      ),
                    ),
                  );
                } else {
                  return const Center(
                    heightFactor: 0.1,
                    child: LinearProgressIndicator(),
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return /*Center(
                  child: SizedBox(
                    child: CircularProgressIndicator(),
                    height: 30.0,
                    width: 30.0,
                  ),
                );*/
                    const Center(
                  heightFactor: 0.1,
                  child: LinearProgressIndicator(),
                );
              } else {
                return const Text("Errors");
              }
            },
          );
        },
      ),
    );
  }
}
