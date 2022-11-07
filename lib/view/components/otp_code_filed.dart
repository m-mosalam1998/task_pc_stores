import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_pc_stores/config/core/colors.dart';

class OtpCodeField extends StatelessWidget {
  const OtpCodeField(
      {Key? key, required this.otpTextController, required this.onCompleted})
      : super(key: key);
  final TextEditingController otpTextController;
  final Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: PinCodeTextField(
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        showCursor: true,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50.h,
          fieldWidth: 40.w,
          activeFillColor: Colors.white,
          inactiveFillColor: Colors.transparent,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.blue.shade50,
        enableActiveFill: true,
        controller: otpTextController,
        onCompleted: onCompleted,
        onChanged: (value) {},
        appContext: context,
      ),
    );
  }
}
