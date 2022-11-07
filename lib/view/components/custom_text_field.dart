import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../config/core/colors.dart';
import '../../model/class/text_field_date.dart';

class TitleWithField extends StatelessWidget {
  const TitleWithField({Key? key, required this.textFieldData})
      : super(key: key);

  final TextFieldData textFieldData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 50.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: TextFormField(
          controller: textFieldData.textController,
          style: TextStyle(
              color: Get.find<ColorsApp>().textAndIconColor, fontSize: 13.sp),
          cursorColor: Get.find<ColorsApp>().errorBorderTextEditor,
          maxLength: textFieldData.disableMaxLen ? null : 10,
          inputFormatters: textFieldData.formater,
          keyboardType: textFieldData.textInputType,
          decoration: InputDecoration(
            labelText: textFieldData.title,
            labelStyle: TextStyle(
                color: Get.find<ColorsApp>().borderTextEditorColor,
                fontSize: 15.sp),
            prefixText: textFieldData.perfixText,
            suffixIconConstraints: BoxConstraints(
                maxHeight: 70.h,
                minHeight: 40.h,
                minWidth: 10.w,
                maxWidth: 40.w),
            isDense: true,
            enabled: textFieldData.enableTextField ?? true,
            enabledBorder: defaultBorder(),
            counter: const Offstage(),
            focusColor: Colors.transparent,
            border: defaultBorder(),
            focusedBorder: defaultBorder(),
            errorStyle: TextStyle(
              color: Get.find<ColorsApp>().errorBorderTextEditor,
              fontSize: 9,
              // fontFamily: GlobalValues.fontFamily,
            ),
            errorBorder: errorBorder(),
            focusedErrorBorder: defaultBorder(),
          ),
          validator: textFieldData.validator,
        ),
      ),
    );
  }

  OutlineInputBorder defaultBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.find<ColorsApp>().borderTextEditorColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
  OutlineInputBorder errorBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          color: Get.find<ColorsApp>().errorBorderTextEditor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      );
}
