import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/config/routes/routes_name.dart';
import 'package:task_pc_stores/controller/registration_controller.dart';
import 'package:task_pc_stores/controller/validator.dart';

import '../model/api/auth.dart';
import '../model/class/text_field_date.dart';
import '../model/class/user.dart';
import '../view/components/show_progress_dialog.dart';

class SignupController extends GetxController {
  late final TextFieldData phoneNumberData;
  late final TextFieldData firstNameData;
  late final TextFieldData lastNameData;
  late final TextFieldData emailData;
  late final Function() signUpTap;
  SignupController({required this.context});
  final BuildContext context;
  final AppValidator appValidator = AppValidator();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final registrationController = Get.find<RegistrationController>();
  late final FirebaseAuthApp firebaseAuthApp;
  @override
  void onInit() {
    signUpTap = () {
      if (formKey.currentState!.validate()) {
        firebaseAuthApp =
            FirebaseAuthApp(registrationController: registrationController);
        AppDilog.showProgressDialog(context: context);
        UserData userData = UserData(
          emial: emailData.textController.text.trim(),
          firstName: firstNameData.textController.text,
          lastName: lastNameData.textController.text,
          phoneNumber: registrationController.phoneNumber,
        );
        firebaseAuthApp
            .setData('users', registrationController.userId, userData.toJson())
            .then((value) {
          Navigator.pop(context);
          Get.offAllNamed(RoutesName.home);
        });
      }
    };
    phoneNumberData = TextFieldData(
      textController:
          TextEditingController(text: registrationController.phoneNumber),
      title: 'Phone Number',
      validator: (value) => null,
      textInputType: TextInputType.phone,
      formater: const [],
      enableTextField: false,
    );
    firstNameData = TextFieldData(
      textController: TextEditingController(),
      title: 'First Name',
      validator: appValidator.isName,
      textInputType: TextInputType.text,
      formater: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
    );
    lastNameData = TextFieldData(
      textController: TextEditingController(),
      title: 'Last Name',
      validator: appValidator.isName,
      textInputType: TextInputType.text,
      formater: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]')),
      ],
    );
    emailData = TextFieldData(
      textController: TextEditingController(),
      title: 'Email',
      validator: appValidator.isEmail,
      textInputType: TextInputType.text,
      formater: [
        FilteringTextInputFormatter.deny(RegExp('[ا-ي]')),
      ],
    );
    super.onInit();
  }
}
