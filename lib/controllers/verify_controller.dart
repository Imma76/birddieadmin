import 'dart:io';

import 'package:birddie_admin/helpers/view_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  var viewState = ViewState.Idle.obs;


  RxBool isVerified = false.obs;

  changeState(ViewState newState) {
    viewState.value = newState;
  }

// Future getUsersInfo()async{
// changeState(ViewState.Busy);
//   try{

// await FirebaseFirestore.instance.collection(collectionPath)
//   }on FirebaseException catch(e){
// changeState(ViewState.Idle);
//   } catch{
//     changeState(ViewState.Idle);
//   }
//}
  ///fucnction for vupdating users Verification status
  Future updateUsersVerification(
      {required String id, bool? verified, required String underReview}) async {
    changeState(ViewState.Busy);
    try {
      await FirebaseFirestore.instance.collection('Users').doc(id).update(
          {'verified': verified, 'under_review': underReview}).then((value) {
        changeState(ViewState.Idle);
      Get.dialog(
           SizedBox(
             height:100, width:100,
             child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Text('updated successfully', textAlign: TextAlign.center,),
          ),
           ),
          transitionDuration: const Duration(seconds: 2));
      });
    } on FirebaseException catch (e) {
        changeState(ViewState.Idle);
       Get.dialog( Dialog(
        child: Text(e.message.toString()),
      ));
    } on SocketException {
         changeState(ViewState.Idle);
      Get.dialog(const Dialog(
        child: Text('Please connect to the internet and try again'),
      ));
    } catch (e) {
        changeState(ViewState.Idle);
       Get.dialog( Dialog(
        child: Text(e.toString()),
      ));
    }
  }
}
