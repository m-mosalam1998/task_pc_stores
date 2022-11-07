import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/config/core/colors.dart';
import 'package:task_pc_stores/controller/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(context: context),
        builder: (controller) {
          return Container(
            color: Get.find<ColorsApp>().cardColor,
            child: Center(
              child: TextButton.icon(
                  onPressed: controller.onTapSignOut,
                  icon: Icon(Icons.exit_to_app,
                      color: Get.find<ColorsApp>().textAndIconColor),
                  label: Text(
                    'Sign Out',
                    style: TextStyle(
                        color: Get.find<ColorsApp>().textAndIconColor),
                  )),
            ),
          );
        });
  }
}
