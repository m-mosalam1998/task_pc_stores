import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:task_pc_stores/controller/login_controller.dart';
import 'package:task_pc_stores/view/components/custom_text_field.dart';

import '../components/button.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(context: context),
        builder: (controller) {
          return SizedBox(
            height: 200.h,
            child: Form(
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
                          'login Page',
                          style: TextStyle(
                            fontSize: 20.sp,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please use you'r phone number",
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TitleWithField(
                    textFieldData: controller.phoneNumberData,
                  ),
                  CustomButton(text: 'Login', onTap: controller.onTapLogin)
                ],
              ),
            ),
          );
        });
  }
}
