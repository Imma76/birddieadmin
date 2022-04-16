import 'package:birddie_admin/controllers/match_controller.dart';
import 'package:birddie_admin/helpers/category.dart';
import 'package:birddie_admin/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MatchPeopleScreen extends GetView<MatchController> {
  String? firstImageUrl;
  String firstName;
  String secondName;
  String secondImageUrl;
  String firstSpendingGuage;
  String secondSpendingGuage;

  String prefferedDateArea1;
  String firstOccupation;
  String secondOccupation;
  String prefferedDateArea2;
  String firstlocation;
  String secondlocation;
  String firstWhoWillPay;
  String secondWhoWillPay;
  String preferredDateLocation1;
  String preferredDateLocation2;

  MatchPeopleScreen(
      {Key? key,
      required this.firstlocation, required this.secondlocation,
      required this.firstWhoWillPay,
      required this.secondWhoWillPay,
      required this.firstOccupation,
      required this.secondOccupation,
      required this.firstImageUrl,
      required this.firstName,
      required this.firstSpendingGuage,
      required this.preferredDateLocation1,
      required this.preferredDateLocation2,
      required this.prefferedDateArea1,
      required this.prefferedDateArea2,
      required this.secondImageUrl,
      required this.secondName,
      required this.secondSpendingGuage,
      })
      : super(key: key);

  final matchController = Get.put(MatchController());

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
        body: Center(
      child: Container(
        height: 619,
        width: 798,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color: Color(0xffE5E5E5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  )),
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 131,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: NetworkImage('$firstImageUrl'),
                            fit: BoxFit.fill)),
                  ),
                  Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(firstName),
                      Text(firstOccupation),
                      Text(firstlocation),
                    ],
                  ),
                  Gap(37),
                  Column(
                    children: [
                      Text(
                          '$preferredDateLocation1  -  Prefered Date Location  -  $preferredDateLocation2'),
                      Text(
                          '$prefferedDateArea1     Prefered Date Area    -   $prefferedDateArea2'),
                      Text(
                          '$firstSpendingGuage   -   Spending Guage  -  $secondSpendingGuage'),
                      Text(
                          '$firstWhoWillPay   -    Who pays?      -  $secondWhoWillPay')
                    ],
                  ),
                  Gap(47),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(secondName),
                      Text(secondOccupation),
                      Text(secondlocation),
                    ],
                  ),
                  //Gap(10),
                  Spacer(),
                  Container(
                    height: 131,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image:  DecorationImage(
                            image: NetworkImage(
                                '$secondImageUrl'),
                            fit: BoxFit.fill)),
                  ),
                ],
              ),
            ),
            Gap(50),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceA,
              children: const [
                Gap(103),
                RoundedContainer(
                  width: 181.0,
                  text: 'MONTH',
                ),
                Gap(20),
                RoundedContainer(
                  width: 181.0,
                  text: 'DAY',
                ),
                Gap(20),
                RoundedContainer(
                  width: 181.0,
                  text: 'TIME',
                ),
                Gap(103),
              ],
            ),
            Gap(27),
            const Divider(
              height: 5,
            ),
            Gap(10.5),
            Row(
              children: [
                Gap(66),
                SizedBox(
                  child: Column(
                    children: const [
                      Center(
                          child: TextWidget(
                        text: "Preffered Date Location",
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                      Gap(5),
                      RoundedContainer(
                        width: 161.0,
                        text: 'MAINLAND',
                      ),
                    ],
                  ),
                ),
                Gap(11),
                SizedBox(
                  child: Column(
                    children: const [
                      Center(
                          child: TextWidget(
                        text: "Preffered Date Area",
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                      Gap(5),
                      RoundedContainer(
                        width: 161.0,
                        text: 'Ikeja Axis',
                      ),
                    ],
                  ),
                ),
                Gap(11),
                SizedBox(
                  child: Column(
                    children: const [
                      Center(
                          child: TextWidget(
                        text: "Preffered Date Setup",
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                      Gap(5),
                      RoundedContainer(
                        width: 161.0,
                        text: 'Bar',
                      ),
                    ],
                  ),
                ),
                Gap(11),
                SizedBox(
                  child: Column(
                    children: const [
                      Center(
                          child: TextWidget(
                        text: "Spending Guage",
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                      Gap(5),
                      RoundedContainer(
                        width: 161.0,
                        text: 'Bar',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 800,
              height: 200,
              child: GridView.builder(
                  itemCount: Category.values.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      return Container(
                        height: 200,
                        //color: Colors.white,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FilterChip(
                              showCheckmark: false,
                              avatarBorder: ContinuousRectangleBorder(),

                              // RectangleBorder(borderRadius: BorderRadius.circular(5)),
                              checkmarkColor: Colors.white,
                              side: BorderSide(
                                  color: controller.containedDateSetup
                                          .contains(Category.values[index].name)
                                      ? mainAppColor
                                      : const Color(0xffE5E5E5),
                                  width: controller.containedDateSetup
                                          .contains(Category.values[index].name)
                                      ? 3.0
                                      : 1.0),
                              backgroundColor: Colors.white,
                              disabledColor: Colors.green,
                              selectedColor: mainAppColor,
                              selected: controller.containedDateSetup
                                  .contains(Category.values[index].name),
                              onSelected: (isSelected) {
                                // setState(() {
                                if (isSelected) {
                                  //Navigator.pop(context);
                                  // controller.hasExpanded.value =
                                  //     false;
                                  controller.containedDateSetup.clear();

                                  controller.containedDateSetup
                                      .add(Category.values[index].name);
                                  controller.selectedSetup.value = true;
                                } else {
                                  controller.selectedSetup.value = false;
                                }
                                // });
                              },
                              labelStyle: TextStyle(
                                color: mainAppColor,
                              ),
                              label: Text(Category.values[index].name,
                                  style: TextStyle(
                                      color: controller.containedDateSetup
                                              .contains(
                                                  Category.values[index].name)
                                          ? Colors.white
                                          : const Color(0xff7D7C7C),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15)),
                            ),
                          ),
                        ),
                      );
                    });
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 55.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('SUBMIT'),
                    style: ElevatedButton.styleFrom(
                        primary: mainAppColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        fixedSize: const Size(133, 27)),
                  ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
      ),
    ));
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    this.fontStyle,
    this.text,
    this.fontSize,
    this.fontWeight,
  }) : super(key: key);

  final double? fontSize;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: GoogleFonts.asap(
        fontSize: fontSize,
        fontStyle: fontStyle,
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    Key? key,
    this.text,
    this.width,
  }) : super(key: key);

  final String? text;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 23,
      child: Center(
          child: Text(
        text.toString(),
        style:
            const TextStyle(color: mainAppColor, fontWeight: FontWeight.w700),
      )),
      decoration: BoxDecoration(
          border: Border.all(color: mainAppColor),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
