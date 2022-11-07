import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldData extends Equatable {
  final String title;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formater;
  final String? perfixText;
  final bool disableMaxLen;
  final TextEditingController textController;
  final bool? enableTextField;
  const TextFieldData(
      {required this.title,
      required this.validator,
      required this.textInputType,
      required this.formater,
      required this.textController,
      this.perfixText,
      this.enableTextField,
      this.disableMaxLen = true});
  @override
  List<Object?> get props => [
        title,
        validator,
        textInputType,
        formater,
        textController,
        disableMaxLen,
        perfixText,
        enableTextField
      ];
}
