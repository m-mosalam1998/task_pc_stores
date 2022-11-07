import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:task_pc_stores/controller/signup_controller.dart';

import '../components/button.dart';
import '../components/custom_text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(context: context),
        builder: (controller) {
          return Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up Page',
                        style: TextStyle(
                          fontSize: 20.sp,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please enter you'r information",
                        style: TextStyle(
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                TitleWithField(
                  textFieldData: controller.firstNameData,
                ),
                TitleWithField(
                  textFieldData: controller.lastNameData,
                ),
                TitleWithField(
                  textFieldData: controller.emailData,
                ),
                TitleWithField(
                  textFieldData: controller.phoneNumberData,
                ),
                CustomButton(text: 'SignUp', onTap: controller.signUpTap)
              ],
            ),
          );
        });
  }
}
