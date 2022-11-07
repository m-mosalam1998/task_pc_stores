import 'package:card_swiper/card_swiper.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/config/routes/generate_route.dart';
import 'package:task_pc_stores/config/routes/routes_name.dart';

import '../config/core/colors.dart';
import '../model/api/auth.dart';
import '../view/registration/login.dart';
import '../view/registration/otp.dart';
import '../view/registration/signup.dart';

class RegistrationController extends GetxController {
  final List<Widget> pages = const [Login(), Otp(), SignUp()];
  final colorsController = Get.find<ColorsApp>();
  final SwiperController swiperControl = SwiperController();
  String verificationId = '';
  String phoneNumber = '';
  String userId = '';
  int resendToken = 0;
  RxInt indexPage = 0.obs;
  var connectivtySttus = ConnectivityResult.none.obs;
  var connectity = Connectivity();
  @override
  void onReady() {
    checkOutoLogin();
    super.onReady();
  }

  checkOutoLogin() async {
    bool validate = await FirebaseAuthApp().checkUserValidate();
    if (validate) {
      Get.offNamed(RoutesName.home);
    }
  }

  @override
  void onInit() {
    FlutterNativeSplash.remove();

    initilizeConnection();
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      connectivtySttus.value = await (Connectivity().checkConnectivity());
    });
    super.onInit();
  }

  initilizeConnection() async {
    connectivtySttus.value = await connectity.checkConnectivity();
  }
}
