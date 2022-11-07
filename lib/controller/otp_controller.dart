import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/config/core/colors.dart';
import 'package:task_pc_stores/controller/registration_controller.dart';

import '../model/api/auth.dart';
import '../view/components/show_progress_dialog.dart';

class OtpController extends GetxController {
  OtpController({required this.context});
  final TextEditingController optTextController = TextEditingController();
  late final Function(String)? onCompleted;
  final colorController = Get.find<ColorsApp>();
  final BuildContext context;
  late final Function() onTapNotMyPhone;
  final FirebaseAuthApp _firebaseAuthApp = FirebaseAuthApp(
      registrationController: Get.find<RegistrationController>());
  RxInt timerTiker = 60.obs;
  @override
  void onInit() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerTiker.value == 0) {
        timer.cancel();
      } else {
        timerTiker.value = timerTiker.value - 1;
      }
    });
    onCompleted = (smsCode) async {
      AppDilog.showProgressDialog(context: context);

      _firebaseAuthApp
          .smsCodeCheck(smsCode)
          .then((value) => Navigator.pop(context));
    };
    onTapNotMyPhone =
        () => Get.find<RegistrationController>().swiperControl.move(0);

    super.onInit();
  }
}
