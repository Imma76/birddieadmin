import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/model/matched_model.dart';
import 'package:birddie_admin/ui/match_people_screen.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class CompleteMatchScreen extends StatefulWidget {
  final List<MatchModel>? matchedList;
  final List<MatchModel>? personToMatch;
  const CompleteMatchScreen({Key? key, this.matchedList, this.personToMatch})
      : super(key: key);

  @override
  State<CompleteMatchScreen> createState() => _CompleteMatchScreenState();
}

class _CompleteMatchScreenState extends State<CompleteMatchScreen> {
  // late VideoPlayerController videocontroller;

  // VideoPlayerController load(index) {
  //   // WidgetsBinding.instance!.addPostFrameCallback((_) {
  //   videocontroller =
  //       VideoPlayerController.network(widget.matchedList![index]['video_url'])
  //         ..addListener(() {
  //           //if (mounted) {
  //           setState(() {});
  //           //   //}
  //         })
  //         ..setLooping(true)
  //         ..initialize().then((_) => videocontroller.pause());
  //   // Your Code Here
  //   // });

  //   return videocontroller;
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   if (file.existsSync()) {
  //     videocontroller = VideoPlayerController.file(file)
  //       ..addListener(() => setState(() {}))
  //       ..setLooping(true)
  //       ..initialize().then((_) => videocontroller.play());
  //   }
  //   load();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: mainAppColor,
              ),
              onPressed: () => Get.back()),
          elevation: 0.0,
          backgroundColor: Colors.transparent),
      backgroundColor: const Color(0xffE5E5E5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 540,
              height: 500,
              child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 50);
                  },
                  shrinkWrap: true,
                  itemCount: widget.matchedList!.length,
                  itemBuilder: (context, index) {
                    // if (mounted) {
                    //   videocontroller = VideoPlayerController.network(
                    //       widget.matchedList![index]['video_url'])
                    //     ..addListener(() => setState(() {}))
                    //     ..setLooping(true)
                    //     ..initialize().then((_) => videocontroller.pause());
                    // }

                    return Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: mainAppColor,
                            borderRadius: BorderRadius.circular(20)),
                        width: 400.w,
                        height: 177.h,
                        child: Row(
                          children: [
                            SizedBox(
                              height: 189,
                              width: 310,
                              child: Chewie(
                                controller: ChewieController(
                                  fullScreenByDefault: true,
                                  //   aspectRatio:
                                  //     4/30,
                                  videoPlayerController:
                                      VideoPlayerController.network(widget
                                          .matchedList![index].videoUrl),
                                  autoPlay: false,
                                  looping: true,
                                ),
                              ),
                              //  VideoPlayerWidget(
                              //     controller:

                              //         //if(mounted){
                              //         load(index))
                            ),
                            const Gap(50),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.matchedList![index].name,
                                    style: GoogleFonts.asap(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    'Job title:  ${widget.matchedList![index].occupation}',
                                    style: GoogleFonts.asap(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Text(
                                    'location:   ${widget.matchedList![index].location}',
                                    style: GoogleFonts.asap(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400)),
                                Gap(20),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => MatchPeopleScreen(
                                        firstlocation: widget.personToMatch![0].location,
                                        secondlocation: widget.matchedList![index].location,
                                        firstWhoWillPay: widget.personToMatch![0].whoWillpay,
                                        secondWhoWillPay:  widget.matchedList![index].whoWillpay,
                                        firstOccupation: widget.personToMatch![0].occupation,
                                        secondOccupation:  widget.matchedList![index].occupation,
                                        firstImageUrl:widget.personToMatch![0].imageUrl,
                                        firstName: widget.personToMatch![0].name,
                                        firstSpendingGuage: widget.personToMatch![0].spendingGuage,
                                        preferredDateLocation1:
                                            widget.personToMatch![0].dateLocation,
                                        preferredDateLocation2:
                                           widget.matchedList![index].dateLocation,
                                        prefferedDateArea1:widget.personToMatch![0].dateArea,
                                        prefferedDateArea2:  widget.matchedList![index].dateArea,
                                        secondImageUrl:  widget.matchedList![index].imageUrl,
                                        secondName:  widget.matchedList![index].name,
                                        secondSpendingGuage:
                                             widget.matchedList![index].spendingGuage));
                                  },
                                  child: Container(
                                      width: 100,
                                      height: 30,
                                      child: const Center(
                                          child: Text('MATCH ME',
                                              style: TextStyle(
                                                  color: Colors.yellow))),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.yellow),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                )
                              ],
                            )
                          ],
                        ));
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
