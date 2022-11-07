import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/controller/registration_controller.dart';

import '../../controller/otp_controller.dart';
import '../components/otp_code_filed.dart';

class Otp extends StatelessWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(
        init: OtpController(context: context),
        builder: (controller) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Otp Page',
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: controller.colorController.textAndIconColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Please use sms code send to you'r phone \n number : ${Get.find<RegistrationController>().phoneNumber}",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: controller.colorController.textAndIconColor),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  OtpCodeField(
                    otpTextController: controller.optTextController,
                    onCompleted: controller.onCompleted,
                  ),
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        text: 'Validator code end in ',
                        style: TextStyle(
                            color: controller.colorController.textAndIconColor,
                            fontSize: 13.sp),
                        children: [
                          TextSpan(
                              text: controller.timerTiker.value.toString(),
                              style: TextStyle(
                                  color: controller
                                      .colorController.otpTimeDurationColor,
                                  fontSize: 14.sp))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not my phone number ',
                          style: TextStyle(
                              color:
                                  controller.colorController.textAndIconColor,
                              fontSize: 13.sp),
                        ),
                        TextButton(
                          onPressed: controller.onTapNotMyPhone,
                          child: Text(
                            'Edit',
                            style: TextStyle(
                                color: controller
                                    .colorController.otpTimeDurationColor,
                                fontSize: 14.sp),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
