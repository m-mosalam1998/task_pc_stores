import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/core/colors.dart';

class AppDilog {
  static Future<void> showProgressDialog(
      {required BuildContext context}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          width: 100.w,
          height: 100.h,
          color: Get.find<ColorsApp>().bodyColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(color: Get.find<ColorsApp>().cardColor),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Loading ...',
                  style:
                      TextStyle(color: Get.find<ColorsApp>().textAndIconColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
