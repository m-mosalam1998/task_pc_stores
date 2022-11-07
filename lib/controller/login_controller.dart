import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/controller/registration_controller.dart';
import 'package:task_pc_stores/controller/validator.dart';
import 'package:task_pc_stores/model/class/text_field_date.dart';
import 'package:task_pc_stores/view/components/show_progress_dialog.dart';

import '../model/api/auth.dart';

class LoginController extends GetxController {
  late final TextFieldData phoneNumberData;
  late final Function() onTapLogin;
  final BuildContext context;
  LoginController({required this.context});
  final AppValidator appValidator = AppValidator();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    phoneNumberData = TextFieldData(
      title: 'Phone Number',
      validator: appValidator.isPhoneNumber,
      textInputType: TextInputType.phone,
      disableMaxLen: false,
      perfixText: '+962 ',
      formater: [
        FilteringTextInputFormatter.allow(RegExp('[0-9]')),
      ],
      textController: TextEditingController(),
    );
    onTapLogin = () async {
      if (formKey.currentState!.validate()) {
        AppDilog.showProgressDialog(context: context);
        FirebaseAuthApp(
                registrationController: Get.find<RegistrationController>())
            .loginUser(
                phone: '+962${phoneNumberData.textController.text.trim()}',
                context: context);
      }
    };
    super.onInit();
  }
}
