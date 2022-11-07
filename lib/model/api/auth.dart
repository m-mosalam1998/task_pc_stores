import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_pc_stores/controller/registration_controller.dart';
import 'package:task_pc_stores/model/class/user.dart';

import '../../config/routes/routes_name.dart';

class FirebaseAuthApp {
  FirebaseAuthApp({this.registrationController});
  final RegistrationController? registrationController;
  Future<void> loginUser({
    required String phone,
    required BuildContext context,
  }) async {
    try {
      registrationController!.phoneNumber = phone;
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.showSnackbar(GetSnackBar(
            title: 'Error',
            message: e.message ?? 'Error in authintcation please try again',
          ));
        },
        codeSent: (String verificationId, int? resendToken) async {
          registrationController!.swiperControl.next(animation: true);
          Navigator.pop(context);
          registrationController!.verificationId = verificationId;
          registrationController!.resendToken = resendToken ?? 0;
        },
        forceResendingToken: registrationController!.resendToken,
        codeAutoRetrievalTimeout: (String verificationId) {
          registrationController!.verificationId = verificationId;
        },
      );
    } catch (error) {
      Navigator.pop(context);
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: error.toString(),
      ));
      debugPrint(error.toString());
    }
  }

  Future smsCodeCheck(smsCode) async {
    try {
      await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: registrationController!.verificationId,
              smsCode: smsCode))
          .then((value) async {
        if (value.user != null) {
          registrationController!.userId = value.user!.uid;
          checkExistDataInSpaciphicCollection(
                  'users', registrationController!.userId)
              .then((value) async {
            if (value) {
              DocumentSnapshot<Map<String, dynamic>> data =
                  await getDataUser(registrationController!.phoneNumber);
              UserData user = UserData.fromJson(data.data()!);
              Get.offAllNamed(
                RoutesName.home,
              );
            } else {
              registrationController!.swiperControl.next(animation: true);
            }
          });
        }
      });
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: 'Error',
        message: e.toString(),
        isDismissible: true,
        duration: const Duration(seconds: 3),
      ));
      debugPrint(e.toString());
    }
  }

  Future<bool> checkExistDataInSpaciphicCollection(
      String collectionId, String docID) async {
    bool exist = false;
    try {
      await FirebaseFirestore.instance
          .collection(collectionId)
          .doc(docID)
          .get()
          .then((doc) {
        exist = doc.exists;
      });
      return exist;
    } catch (e) {
      // If any error
      debugPrint(e.toString());
      return false;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDataUser(
      String userId) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .get();
  }

  Future setData(String mainTable, String id, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection(mainTable).doc(id).set(data);
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<bool> checkUserValidate() async {
    if (FirebaseAuth.instance.currentUser != null) {
      bool isData = await checkExistDataInSpaciphicCollection(
          'users', FirebaseAuth.instance.currentUser!.uid);
      return isData;
    }
    return false;
  }
}
