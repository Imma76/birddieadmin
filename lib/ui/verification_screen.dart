import 'package:birddie_admin/controllers/match_controller.dart';
import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/ui/confirm_verification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jiffy/jiffy.dart';

class VerificationScreen extends StatefulWidget {
  VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final controller = Get.put(MatchController());
  String data = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 742.w,
          height: 87.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.textController,
              onChanged: (value) {
                setState(() {
                  data = value.toString();
                });
              },
              decoration: InputDecoration(
                suffixIcon: Image.asset('assets/Search.png'),
                hintText: 'Search...',
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder:
                    const OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.white),
        ),
        Gap(20),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 500,
                  width: 1000,
                  decoration: BoxDecoration(
                    color: mainAppColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: data.isEmpty
                          ? controller.getUsers().asBroadcastStream()
                          : controller
                              .getFilteredUsers(
                                  data.trim().toLowerCase().toString())
                              .asBroadcastStream(),
                      builder: (context, AsyncSnapshot snapshot) {
                        // if (!snapshot.hasDatar) {

                        // print(snapshot.data.docs[0]['date_location']);
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        List searchedList = [];

                        if (snapshot.hasData) {
                          return ListView.separated(
                            separatorBuilder: (context, index) => const Gap(20),
                            shrinkWrap: true,
                            itemCount: snapshot.data.docs.length,
                            itemBuilder: (context, index) {
                              // var startDate = Jiffy(
                              //     "${snapshot.data.docs[index]['dateOfBirth']}}",
                              //     "dd-MM-yyyy");
                              // var endDate = Jiffy(DateTime.now(),).format("dd-MM-yyyy");
                              // var differenceOfDays =
                              //     startDate.diff(endDate, Units.YEAR);
                              // print(differenceOfDays);
                              // final ageTo =
                              //     int.tryParse(snapshot.data.docs[index]['age_to']);
                              // final ageFrom =
                              //     int.tryParse(snapshot.data.docs[index]['age_from']);
                              // var dateStart = int.parse(
                              //     snapshot.data.docs[index]['date_start']);
                              // var dateEnd = DateTime(
                              //     snapshot.data.docs[index]['date_end']);
                              // var newDateEnd =
                              //     snapshot.data.docs[index]['date_end'];
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => ConfirmVerification(
                                        isVerified: snapshot.data.docs[index]
                                            ['verified'],
                                        id: snapshot.data.docs[index].id,
                                        imageUrl: snapshot.data.docs[index]
                                            ['imageUrl'],
                                        videoUrl: snapshot.data.docs[index]
                                            ['videoUrl'],
                                      ));
                                  // final jiffyDate = Jiffy(snapshot
                                  //         .data.docs[index]['date_start'])
                                  //     .diff(snapshot.data.docs[index]
                                  //         ['date_end']);

                                  //  print(jiffyDate);
                                  print('done');
                                  var matchedList = [];
                                },
                                child: Center(
                                  child: Container(
                                    width: 817.w,
                                    height: 87.h,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                                snapshot.data.docs[index]
                                                    ['imageUrl'],
                                                width: 77,
                                                height: 75)
                                            // Image.network(
                                            // controller
                                            //       .usersList[index].imageUrl
                                            //       .toString(),
                                            // ),
                                            ),
                                        Gap(31.sp),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${snapshot.data.docs[index]['name']}',
                                              style: GoogleFonts.asap(
                                                  fontSize: 25.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '${snapshot.data.docs[index]['occupation']}',
                                              style: GoogleFonts.asap(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              '${snapshot.data.docs[index]['location']}',
                                              style: GoogleFonts.asap(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        const Text('MATCH'),
                                        Gap(20.w),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 10.0),
                                          child: Image.asset(
                                              'assets/match_sign.png'),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                        return const SizedBox();

                        // return SizedBox(
                        //   height: 200,
                        //   child: ListView(
                        //     shrinkWrap: true, children: [

                        //     ...snapshot.data!.docs.where((element) {
                        //       return element['date_location']
                        //               .toString()
                        //               .contains(controller.russianList[0].dateLocation) ==
                        //           true;
                        //     }).map((data) {
                        //       // print(data);
                        //       return Text(data['date_location']);
                        //     }),

                        //   ]),
                        // );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
