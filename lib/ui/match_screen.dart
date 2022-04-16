import 'package:birddie_admin/controllers/match_controller.dart';
import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/model/matched_model.dart';
import 'package:birddie_admin/ui/complete_match_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  //List data = [];
  @override
  final controller = Get.put(MatchController());
  String data = "";
  String instantSearchText = '';
  String matchSearchText = '';
  String sponsoredSearchText = '';
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    Widget widget2 = const Text('mmmm');

    bool hasExpanded = false;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // ElevatedButton(
        //     onPressed: () {
        //       print(controller.findUser());
        //     },
        //     child: const Text('press')),
        Container(
          width: 742.w,
          height: 87.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                // final search = data.where((element) {
                //   return element['name'].toString().toLowerCase().contains(.toLowerCase());
                // }).toList();
                setState(() {
                  data = value;
                  instantSearchText = value;
                  sponsoredSearchText = value;

                  matchSearchText = value;
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
        Gap(42.h),
        SizedBox(
          height: 400,
          child: DefaultTabController(
            length: 4,
            child: Container(
              width: 1000.w,
              height: 1000.h,
              decoration: BoxDecoration(
                  color: mainAppColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  TabBar(
                    indicator: BoxDecoration(color: Colors.red[400]),
                    labelColor: mainAppColor,
                    unselectedLabelColor: mainAppColor,
                    tabs: [
                      Tab(
                          child: Text(
                        'RUSSIAN \nROULETTE',
                        style: GoogleFonts.asap(color: Colors.white),
                      )),
                      Tab(
                        child: Text(
                          'SPONSORED \nROULETTE',
                          style: GoogleFonts.asap(color: Colors.white),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'INSTANT \nROULETTE',
                          style: GoogleFonts.asap(color: Colors.white),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'MATCH \nROULETTE',
                          style: GoogleFonts.asap(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 300,
                    child: TabBarView(
                      children: [
                        StreamBuilder<QuerySnapshot>(
                          stream: data.isEmpty
                              ? controller
                                  .getRussianRoulette()
                                  .asBroadcastStream()
                              : controller
                                  .getFilteredRussianRoulette(
                                      data.trim().toLowerCase())
                                  .asBroadcastStream(),
                          builder: (context, AsyncSnapshot snapshot) {
                            // if (!snapshot.hasData) {

                            // print(snapshotr.data.docs[0]['date_location']);
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            }
                            if (snapshot.hasData) {
                              // data = snapshot.data.docs;
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Gap(20),
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  final snapshotData =
                                      snapshot.data.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // var startDate = Jiffy("2021-12-23", "yyyy-MM");
                                      // var endDate = Jiffy("2010-12-23", "yyyy-MM");
                                      // var differenceOfDays = startDate.diff(endDate, Units.YEAR);

                                      bool checkAgeRange = false;

                                      List<MatchModel>? matchedList = [];
                                      List<MatchModel>? personToMatch = [];
                                      final date =
                                          snapshot.data!.docs.where((element) {
                                        print(element.id);
                                        // if (snapshotData[index].id !=
                                        //         element['id'] &&
                                        //     snapshotData['gender'] !=
                                        //         element['gender']) {
                                        for (int i in snapshot.data.docs[index]
                                            ['age_range']) {
                                          for (int b in element['age_range']) {
                                            if (i == b) {
                                              setState(() {
                                                checkAgeRange = true;
                                              });
                                            }
                                          }
                                          //    }
                                        }

                                        //return element;

                                        return element.id !=
                                                snapshot.data.docs[index].id &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location'] &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            checkAgeRange &&
                                            controller.checkDates(
                                                currentStartDate:
                                                    snapshotData['date_start'],
                                                currentEndDate:
                                                    snapshotData['date_end'],
                                                matchStartDate:
                                                    element['date_start'],
                                                matchEndDate:
                                                    element['date_end']);
                                      }).map((data1) {
                                        print(data1);
                                        personToMatch.add(MatchModel(
                                            dateArea: snapshotData['date_area'],
                                            spendingGuage:
                                                snapshotData['spending_guage'],
                                            whoWillpay:
                                                snapshotData['who_will_spend'],
                                            name: snapshotData['name'],
                                            dateLocation:
                                                snapshotData['date_location'],
                                            dateSetup:
                                                snapshotData['date_setup'],
                                            imageUrl: snapshotData['image_url'],
                                            location: snapshotData['location'],
                                            occupation:
                                                snapshotData['occupation'],
                                            videoUrl:
                                                snapshotData['video_url']));
                                        matchedList.add(MatchModel(
                                            dateArea: data1['date_area'],
                                            spendingGuage:
                                                data1['spending_guage'],
                                            whoWillpay: data1['who_will_spend'],
                                            name: data1['name'],
                                            dateLocation:
                                                data1['date_location'],
                                            dateSetup: data1['date_setup'],
                                            imageUrl: data1['image_url'],
                                            location: data1['location'],
                                            occupation: data1['occupation'],
                                            videoUrl: data1['video_url']));
                                        Get.to(() => CompleteMatchScreen(
                                              matchedList: matchedList,
                                              personToMatch: personToMatch,
                                            ));
                                        //return Text(data['date_location']);
                                      });
                                      print(date);
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
                                                    snapshotData['image_url'],
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
                                                  '${snapshotData['name']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 25.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['occupation']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['location']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
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
                          },
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: sponsoredSearchText.isEmpty
                              ? controller
                                  .getSponsoredRoulette()
                                  .asBroadcastStream()
                              : controller
                                  .getFilteredSponsoredRoulette(
                                      data.trim().toLowerCase())
                                  .asBroadcastStream(),
                          builder: (context, AsyncSnapshot snapshot) {
                            // if (!snapshot.hasData) {

                            // print(snapshotr.data.docs[0]['date_location']);
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            }
                            if (snapshot.hasData) {
                              // data = snapshot.data.docs;
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Gap(20),
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  final snapshotData =
                                      snapshot.data.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // var startDate = Jiffy("2021-12-23", "yyyy-MM");
                                      // var endDate = Jiffy("2010-12-23", "yyyy-MM");
                                      // var differenceOfDays = startDate.diff(endDate, Units.YEAR);
                                      bool checkAgeRange = false;
                                      List<MatchModel>? matchedList = [];
                                      List<MatchModel>? personToMatch = [];
                                      final date =
                                          snapshot.data!.docs.where((element) {
                                        if (snapshot.data.docs[index].id !=
                                                element.id &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location']) {
                                          for (int i in snapshot
                                              .data.docs[index]['age_range']) {
                                            for (int b
                                                in element['age_range']) {
                                              if (i == b) {
                                                setState(() {
                                                  checkAgeRange = true;
                                                });
                                              }
                                            }
                                          }
                                          //return element;
                                        }

                                        return element.id !=
                                                snapshot.data.docs[index].id &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location'] &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            checkAgeRange &&
                                            controller.checkDates(
                                                currentStartDate:
                                                    snapshotData['date_start'],
                                                currentEndDate:
                                                    snapshotData['date_end'],
                                                matchStartDate:
                                                    element['date_start'],
                                                matchEndDate:
                                                    element['date_end']);
                                      }).map((data1) {
                                        print(data1['date_location']);
                                        personToMatch.add(MatchModel(
                                            dateArea: snapshotData['date_area'],
                                            spendingGuage:
                                                snapshotData['spending_guage'],
                                            whoWillpay:
                                                snapshotData['who_will_spend'],
                                            name: snapshotData['name'],
                                            dateLocation:
                                                snapshotData['date_location'],
                                            dateSetup:
                                                snapshotData['date_setup'],
                                            imageUrl: snapshotData['image_url'],
                                            location: snapshotData['location'],
                                            occupation:
                                                snapshotData['occupation'],
                                            videoUrl:
                                                snapshotData['video_url']));
                                        matchedList.add(MatchModel(
                                            dateArea: data1['date_area'],
                                            spendingGuage:
                                                data1['spending_guage'],
                                            whoWillpay: data1['who_will_spend'],
                                            name: data1['name'],
                                            dateLocation:
                                                data1['date_location'],
                                            dateSetup: data1['date_setup'],
                                            imageUrl: data1['image_url'],
                                            location: data1['location'],
                                            occupation: data1['occupation'],
                                            videoUrl: data1['video_url']));
                                        Get.to(() => CompleteMatchScreen(
                                              matchedList: matchedList,
                                              personToMatch: personToMatch,
                                            ));
                                        //return Text(data['date_location']);
                                      });
                                      print(personToMatch.length);
                                      print(date);
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
                                                    snapshotData['image_url'],
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
                                                  '${snapshotData['name']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 25.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['occupation']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['location']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
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
                          },
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: instantSearchText.isEmpty
                              ? controller
                                  .getInstantRoulette()
                                  .asBroadcastStream()
                              : controller
                                  .getFilteredInstantRoulette(
                                      data.trim().toLowerCase())
                                  .asBroadcastStream(),
                          builder: (context, AsyncSnapshot snapshot) {
                            // if (!snapshot.hasData) {

                            // print(snapshotr.data.docs[0]['date_location']);
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            }
                            if (snapshot.hasData) {
                              // data = snapshot.data.docs;
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Gap(20),
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  final snapshotData =
                                      snapshot.data.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // var startDate = Jiffy("2021-12-23", "yyyy-MM");
                                      // var endDate = Jiffy("2010-12-23", "yyyy-MM");
                                      // var differenceOfDays = startDate.diff(endDate, Units.YEAR);
                                      bool checkAgeRange = false;
                                      List<MatchModel>? matchedList = [];
                                      List<MatchModel>? personToMatch = [];
                                      final date =
                                          snapshot.data!.docs.where((element) {
                                        if (snapshot.data.docs[index].id !=
                                                element.id &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location']) {
                                          for (int i in snapshot
                                              .data.docs[index]['age_range']) {
                                            for (int b
                                                in element['age_range']) {
                                              if (i == b) {
                                                setState(() {
                                                  checkAgeRange = true;
                                                });
                                              }
                                            }
                                          }
                                          //return element;
                                        }

                                        return element.id !=
                                                snapshot.data.docs[index].id &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location'] &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            checkAgeRange &&
                                            controller.checkDates(
                                                currentStartDate:
                                                    snapshotData['date_start'],
                                                currentEndDate:
                                                    snapshotData['date_end'],
                                                matchStartDate:
                                                    element['date_start'],
                                                matchEndDate:
                                                    element['date_end']);
                                      }).map((data1) {
                                        print(data1['date_location']);
                                        personToMatch.add(MatchModel(
                                            dateArea: snapshotData['date_area'],
                                            spendingGuage:
                                                snapshotData['spending_guage'],
                                            whoWillpay:
                                                snapshotData['who_will_spend'],
                                            name: snapshotData['name'],
                                            dateLocation:
                                                snapshotData['date_location'],
                                            dateSetup:
                                                snapshotData['date_setup'],
                                            imageUrl: snapshotData['image_url'],
                                            location: snapshotData['location'],
                                            occupation:
                                                snapshotData['occupation'],
                                            videoUrl:
                                                snapshotData['video_url']));
                                        matchedList.add(MatchModel(
                                            dateArea: data1['date_area'],
                                            spendingGuage:
                                                data1['spending_guage'],
                                            whoWillpay: data1['who_will_spend'],
                                            name: data1['name'],
                                            dateLocation:
                                                data1['date_location'],
                                            dateSetup: data1['date_setup'],
                                            imageUrl: data1['image_url'],
                                            location: data1['location'],
                                            occupation: data1['occupation'],
                                            videoUrl: data1['video_url']));
                                        Get.to(() => CompleteMatchScreen(
                                              matchedList: matchedList,
                                              personToMatch: personToMatch,
                                            ));
                                        //return Text(data['date_location']);
                                      });
                                      print(personToMatch.length);
                                      print(date);
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
                                                    snapshotData['image_url'],
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
                                                  '${snapshotData['name']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 25.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['occupation']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['location']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
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
                          },
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: matchSearchText.isEmpty
                              ? controller
                                  .getmatchRoulette()
                                  .asBroadcastStream()
                              : controller
                                  .getFilteredMatchRoulette(
                                      data.trim().toLowerCase())
                                  .asBroadcastStream(),
                          builder: (context, AsyncSnapshot snapshot) {
                            // if (!snapshot.hasData) {

                            // print(snapshotr.data.docs[0]['date_location']);
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              ));
                            }
                            if (snapshot.hasData) {
                              // data = snapshot.data.docs;
                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const Gap(20),
                                shrinkWrap: true,
                                itemCount: snapshot.data.docs.length,
                                itemBuilder: (context, index) {
                                  final snapshotData =
                                      snapshot.data.docs[index];
                                  return GestureDetector(
                                    onTap: () {
                                      // var startDate = Jiffy("2021-12-23", "yyyy-MM");
                                      // var endDate = Jiffy("2010-12-23", "yyyy-MM");
                                      // var differenceOfDays = startDate.diff(endDate, Units.YEAR);
                                      bool checkAgeRange = false;
                                      List<MatchModel>? matchedList = [];
                                      List<MatchModel>? personToMatch = [];
                                      final date =
                                          snapshot.data!.docs.where((element) {
                                        if (snapshot.data.docs[index].id !=
                                                element.id &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location']) {
                                          for (int i in snapshot
                                              .data.docs[index]['age_range']) {
                                            for (int b
                                                in element['age_range']) {
                                              if (i == b) {
                                                setState(() {
                                                  checkAgeRange = true;
                                                });
                                              }
                                            }
                                          }
                                          return element;
                                        }

                                        return element.id !=
                                                snapshot.data.docs[index].id &&
                                            element['date_location']
                                                    .toString() ==
                                                snapshot.data.docs[index]
                                                    ['date_location'] &&
                                            element['gender'] !=
                                                snapshot.data.docs[index]
                                                    ['gender'] &&
                                            checkAgeRange;
                                        //&& controller.checkDates(
                                        //currentStartDate:
                                        //   snapshotData['date_start'],
                                        //currentEndDate:
                                        //   snapshotData['date_end'],
                                        // matchStartDate:
                                        // element['date_start'],
                                        //matchEndDate: element['date_end']);
                                      }).map((data1) {
                                        print(data1['date_location']);
                                        personToMatch.add(MatchModel(
                                            dateArea: snapshotData['date_area'],
                                            spendingGuage:
                                                snapshotData['spending_guage'],
                                            whoWillpay:
                                                snapshotData['who_will_spend'],
                                            name: snapshotData['name'],
                                            dateLocation:
                                                snapshotData['date_location'],
                                            dateSetup:
                                                snapshotData['date_setup'],
                                            imageUrl: snapshotData['image_url'],
                                            location: snapshotData['location'],
                                            occupation:
                                                snapshotData['occupation'],
                                            videoUrl:
                                                snapshotData['video_url']));
                                        matchedList.add(MatchModel(
                                            dateArea: data1['date_area'],
                                            spendingGuage:
                                                data1['spending_guage'],
                                            whoWillpay: data1['who_will_spend'],
                                            name: data1['name'],
                                            dateLocation:
                                                data1['date_location'],
                                            dateSetup: data1['date_setup'],
                                            imageUrl: data1['image_url'],
                                            location: data1['location'],
                                            occupation: data1['occupation'],
                                            videoUrl: data1['video_url']));
                                        Get.to(() => CompleteMatchScreen(
                                              matchedList: matchedList,
                                              personToMatch: personToMatch,
                                            ));
                                        //return Text(data['date_location']);
                                      });
                                      print(personToMatch.length);
                                      print(date);
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
                                                    snapshotData['image_url'],
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
                                                  '${snapshotData['name']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 25.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['occupation']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  '${snapshotData['location']}',
                                                  style: GoogleFonts.asap(
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
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
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //title: const Text('Tabs Demo'),

            //child
          ),
        ),
      ],
    );
    // });
  }
}
