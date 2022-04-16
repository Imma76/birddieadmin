import 'package:birddie_admin/controllers/sign_in_controller.dart';
import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/helpers/view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends GetView<SignInController> {
  SignIn({Key? key}) : super(key: key);
  final signIn = Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            const Gap(300),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/new_logo.png'),
                Text('ADMIN LOGIN',
                    style: GoogleFonts.asap(color: Colors.white)),
                Gap(20.h),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: 274.w,
                  height: 44.h,
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: TextField(
                              controller: controller.emailController,
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                // suffixIcon: Image.asset('assets/Search.png'),
                                hintText: 'USERNAME',
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(17.h),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  width: 274.w,
                  height: 44.h,
                  padding: const EdgeInsets.only(top: 10),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: TextField(
                      controller: controller.passwordController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        // suffixIcon: Image.asset('assets/Search.png'),
                        hintText: 'PASSWORD',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        enabledBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                        focusedBorder:
                            OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
                Gap(30.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Obx(() {
                    return ElevatedButton(
                      onPressed: () {
                        controller.login();
                      },
                      child: controller.viewState == ViewState.Busy
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text('Login',
                              style: GoogleFonts.asap(
                                  textStyle: const TextStyle(
                                      fontStyle: FontStyle.italic))),
                      style: ElevatedButton.styleFrom(
                        primary: mainAppColor,
                        fixedSize: const Size(172, 48),
                      ),
                    );
                  }),
                ),
                const Gap(200),
              ],
            ),
          ],
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/sign_in.png'), fit: BoxFit.fitWidth)),
      ),
    );
  }
}
