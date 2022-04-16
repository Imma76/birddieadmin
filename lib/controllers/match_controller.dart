import 'package:birddie_admin/helpers/view_state.dart';
import 'package:birddie_admin/model/russian_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class MatchController extends GetxController {
  final firebase = FirebaseFirestore.instance;
  TextEditingController textController = TextEditingController();
  var viewState = ViewState.Idle.obs;

  void changeState(ViewState newState) {
    viewState.value = newState;
  }

  RxString data = "".obs;

  RxList containedDateSetup = [].obs;
  RxBool selectedSetup = false.obs;

  RxList usersList = [].obs;
  Stream<QuerySnapshot> getRussianRoulette() {
    return firebase.collection('Russian Roulette').snapshots();
  }

  Stream<QuerySnapshot> getFilteredRussianRoulette(String query) {
    return firebase
        .collection('Russian Roulette')
        .where("name", isEqualTo: query)
        .snapshots();
  }

  Stream<QuerySnapshot> getInstantRoulette() {
    return firebase.collection('Instant Roulette').snapshots();
  }

  Stream<QuerySnapshot> getFilteredInstantRoulette(String query) {
    return firebase
        .collection('Instant Roulette')
        .where("name", isEqualTo: query)
        .snapshots();
  }

  Stream<QuerySnapshot> getSponsoredRoulette() {
    return firebase.collection('Sponsored Roulette').snapshots();
  }

  Stream<QuerySnapshot> getFilteredSponsoredRoulette(String query) {
    return firebase
        .collection('sponsored Roulette')
        .where("name", isEqualTo: query)
        .snapshots();
  }

  Stream<QuerySnapshot> getmatchRoulette() {
    return firebase.collection('Match Roulette').snapshots();
  }

  Stream<QuerySnapshot> getFilteredMatchRoulette(String query) {
    return firebase
        .collection('Match Roulette')
        .where("name", isEqualTo: query)
        .snapshots();
  }

  bool checkDates(
      {required String currentStartDate,
      required String currentEndDate,
      required String matchStartDate,
      required String matchEndDate}) {
    var otherStartDate = Jiffy("$matchStartDate", "dd-MM-yyyy");
    var otherEndDate2 = Jiffy("${matchEndDate}", "dd-MM-yyyy");
    var currentStartDateFormat = Jiffy("${currentStartDate}", "dd-MM-yyyy");
    var currentEndDateFormat = Jiffy("${currentEndDate}", "dd-MM-yyyy");

    var differenceOfDays = currentStartDateFormat.isBetween(
        otherStartDate, otherEndDate2, Units.DAY);
    var differenceOfDays2 = currentEndDateFormat.isBetween(
        otherStartDate, otherEndDate2, Units.DAY);
        
    return differenceOfDays || differenceOfDays2;
  }

  Stream<QuerySnapshot> getUsers() {
    return firebase.collection('Users').snapshots();
  }

  Stream<QuerySnapshot> getFilteredUsers(String query) {
    return firebase
        .collection('Users')
        .where("name", isEqualTo: query)
        .snapshots();
  }

  Future findUser() async {
    final get =
        await FirebaseFirestore.instance.collection('Russian Roulette').get();
    for (var snapshot in get.docs) {
      print(snapshot.id);
    }
  }

  RxList russianList = [].obs;

  // Future getUsers() async {
  //   changeState(ViewState.Busy);
  //   try {
  //     await firebase.collection('Users').get().then((value) {
  //       for (var element in value.docs) {
  //         //  print(element['age']);
  //         usersList.add(Users(
  //           age: element['age'] ?? '',
  //           dateOfBirth: element['dateOfBirth'] ?? '',
  //           imageUrl: element['imageUrl'] ?? '',
  //           videoUrl: element['videoUrl'] ?? '',
  //           isSubscribed: element['isSubscribed'] ?? false,
  //           isVerified: element['verified'] ?? false,
  //           gender: element['gender'] ?? '',
  //           // location: element['date_location'] ?? '',
  //           underReview: element['under_review'] ?? false,
  //           occupation: element['occupation'] ?? '',
  //           name: element['name'] ?? '',
  //         ));
  //       }
  //       //     print(element['age']);
  //     });
  //     changeState(ViewState.Idle);
  //   } on FirebaseException catch (e) {
  //     changeState(ViewState.Idle);
  //     print(e.message);
  //     // Get.dialog(
  //     //     Dialog(
  //     //       child: Text(e.message.toString()),
  //     //     ),
  //     //     transitionDuration: const Duration(seconds: 2));
  //   } catch (e) {
  //     print(e.toString());
  //     changeState(ViewState.Idle);
  //     // Get.dialog(
  //     //     Dialog(
  //     //       child: Text(e.toString()),
  //     //     ),
  //     //     transitionDuration: const Duration(seconds: 2));
  //   }
  // }
}
