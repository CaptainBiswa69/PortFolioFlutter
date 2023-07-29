import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  HomeController();
  RxBool isLoading = false.obs;
  RxInt activeIndex = 0.obs;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();

  Future<void> launchWeb({required String link}) async {
    await launchUrl(Uri.parse(link));
    update();
  }

  Future<void> launchViber({required String link}) async {
    await launchUrl(Uri(scheme: "tel", path: link),
        mode: LaunchMode.externalApplication);
    update();
  }
}
