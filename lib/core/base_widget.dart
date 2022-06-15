import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseWidget extends StatelessWidget {
  const BaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // LanguageController controller = Get.find();
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBuildWidget(context),
      appBar: getToolbar(context),
      // bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  Widget getBuildWidget(BuildContext context);

  PreferredSizeWidget? getToolbar(BuildContext buildContext) {
    return null;
  }

  // Widget? getBottomNavigationBar(BuildContext context) {
  //   return BottomNavigationBar(items: items);
  // }
}
