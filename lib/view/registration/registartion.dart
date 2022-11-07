import 'package:card_swiper/card_swiper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/registration_controller.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegistrationController>(
        init: RegistrationController(),
        id: 'Registration',
        builder: (controller) {
          return Scaffold(
            backgroundColor: controller.colorsController.bodyColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Task PC Stors Company',
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: controller.colorsController.cardColor,
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: controller.colorsController.cardColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.w)),
                        child: Obx(
                          () => controller.connectivtySttus.value ==
                                  ConnectivityResult.none
                              ? SizedBox(
                                  width: 300.w,
                                  height: controller.indexPage.value == 2
                                      ? 400.h
                                      : 250.h,
                                  child: const Center(
                                    child: Text(
                                        "No Internet Connction Please reconnection"),
                                  ),
                                )
                              : SizedBox(
                                  width: 300.w,
                                  height: controller.indexPage.value == 2
                                      ? 400.h
                                      : 250.h,
                                  child: Swiper(
                                    axisDirection: AxisDirection.right,
                                    scrollDirection: Axis.horizontal,
                                    autoplay: false,
                                    loop: false,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    controller: controller.swiperControl,
                                    itemCount: controller.pages.length,
                                    onIndexChanged: (value) {
                                      if (value == 2) {
                                        controller.update(['Registration']);
                                        controller.indexPage.value = value;
                                        print(value);
                                      }
                                    },
                                    itemBuilder: (context, index) =>
                                        controller.pages.elementAt(index),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
