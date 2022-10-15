import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Getclass controllers = Get.put(Getclass());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          maxLines: 6,
          style: TextStyle(fontSize: 13),
          controllers.title,
        ),
      ),
      body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 10,
            ),
            Image.network(controllers.imageurl),
            const Divider(
              thickness: 2,
            ),
            Text(controllers.subtitle),
          ]),
    );
  }
}
