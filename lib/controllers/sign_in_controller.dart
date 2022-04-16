import 'package:birddie_admin/helpers/view_state.dart';
import 'package:birddie_admin/ui/master_detail_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  var viewState = ViewState.Idle.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void changeState(ViewState newState) {
    viewState.value = newState;
  }

  RxBool isLoggedIn = false.obs;
  RxBool failed = false.obs;
  Future login() async {
    changeState(ViewState.Busy);
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim().toString(),
          password: passwordController.text.trim().toString());

      isLoggedIn.value = true;
      Get.off(MasterDetailContainer());
    } on FirebaseAuthException catch (e) {
      changeState(ViewState.Idle);
      Get.dialog(
          Dialog(
            child: Text(e.message.toString()),
          ),
          transitionDuration: const Duration(seconds: 2));
      //return e.message;
    } catch (e) {
      changeState(ViewState.Idle);
      Get.dialog(
          Dialog(
            child: Text(e.toString()),
          ),
          transitionDuration: const Duration(seconds: 2));
      //return e.toString();
    }
  }
}
