import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Getclass extends GetxController {
  var title = "";
  var subtitle = "";
  var imageurl = "";

  void updatedata(String newTitle, String newSubtitle, String newImageurl) {
    title = newTitle;
    subtitle = newSubtitle;
    imageurl = newImageurl;
    update();
  }
}
