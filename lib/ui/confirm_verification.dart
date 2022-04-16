import 'package:birddie_admin/controllers/verify_controller.dart';
import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/helpers/view_state.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class ConfirmVerification extends GetView<VerifyController> {
  final putController = Get.put(VerifyController());
  String? videoUrl;
  bool isVerified;
  String? imageUrl;
  String? id;
  ConfirmVerification(
      {Key? key,
      this.id,
      required this.isVerified,
      this.videoUrl,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: mainAppColor,
            ),
            onPressed: () => Get.back()),
      ),
      backgroundColor: const Color(0xffE5E5E5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 189,
                  width: 310,
                  child: Chewie(
                    controller: ChewieController(
                      //fullScreenByDefault: true,
                      //   aspectRatio:
                      //     4/30,
                      videoPlayerController:
                          VideoPlayerController.network(videoUrl.toString()),
                      autoPlay: false,
                      looping: true,
                    ),
                  ),
                  //  VideoPlayerWidget(
                  //     controller:

                  //         //if(mounted){
                  //         load(index))
                ),
                const Gap(100),
                Image.network(imageUrl.toString())
              ],
            ),
            const Gap(100),
            Obx(() {
              return controller.viewState.value == ViewState.Busy
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (isVerified) {
                                    return;
                                  }else{
                                     controller.updateUsersVerification(
                                      id: id.toString(),
                                      underReview: "pass",
                                      verified: true);
                                  }
                                 
                                },
                                style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(172, 48),
                                    primary: isVerified? Colors.red[200]: mainAppColor),
                                child: Text('Verify',
                                    style: GoogleFonts.asap(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontStyle: FontStyle.italic)))),
                        Gap(100),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.updateUsersVerification(
                                    id: id.toString(),
                                    underReview: "failed",
                                    verified: false);
                              },
                              style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(172, 48),
                                  primary: mainAppColor),
                              child: Text('Re-verify',
                                  style: GoogleFonts.asap(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontStyle: FontStyle.italic))),
                        )
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }
}
