import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'item.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({
    required this.itemSelectedCallback,
    this.selectedItem,
  });

  final ValueChanged<Item> itemSelectedCallback;
  final Item? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/new_logo.png'),
          Gap(8.h),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'Welcome',
                  style: GoogleFonts.asap(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
              TextSpan(
                text: ' Admin',
                style: GoogleFonts.asap(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ]),
          ),
          Gap(25.h),
          Expanded(
            child: ListView(
                children: items.map((item) {
              return Center(
                child: ListTile(
                  title: Center(
                      child: Text(item.title,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.asap(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white))),
                  onTap: () => itemSelectedCallback(item),
                  selected: selectedItem == item,
                ),
              );
            }).toList()),
          ),
        ]);
  }
}
