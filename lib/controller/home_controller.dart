import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/config/routes/routes_name.dart';
import 'package:task_pc_stores/model/api/auth.dart';
import 'package:task_pc_stores/view/components/show_progress_dialog.dart';

class HomeController extends GetxController {
  late final FirebaseAuthApp firebaseAuthApp;
  late final Function() onTapSignOut;
  final BuildContext context;
  HomeController({required this.context});
  @override
  void onInit() {
    firebaseAuthApp = FirebaseAuthApp();
    onTapSignOut = () async {
      AppDilog.showProgressDialog(context: context);
      await firebaseAuthApp.signOut().whenComplete(() {
        Navigator.pop(context);
        Get.offAllNamed(RoutesName.registration);
      });
    };
    super.onInit();
  }
}
