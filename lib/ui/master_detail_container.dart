import 'package:birddie_admin/helpers/constants.dart';
import 'package:birddie_admin/ui/match_screen.dart';
import 'package:birddie_admin/ui/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'item.dart';
import 'item_details.dart';
import 'item_listing.dart';

class MasterDetailContainer extends StatefulWidget {
  @override
  _ItemMasterDetailContainerState createState() =>
      _ItemMasterDetailContainerState();
}

class _ItemMasterDetailContainerState extends State<MasterDetailContainer> {
  static const int kTabletBreakpoint = 600;

  Item? _selectedItem = Item(title: 'subtitle', widget: MatchScreen());

  Widget _buildMobileLayout() {
    return Material(
      color: mainAppColor,
      child: ItemListing(
        itemSelectedCallback: (item) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ItemDetails(
                  isInTabletLayout: false,
                  item: item,
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Material(
            color: mainAppColor,
            elevation: 4.0,
            child: ItemListing(
              itemSelectedCallback: (item) {
                setState(() {
                  _selectedItem = item;
                });
              },
              selectedItem: _selectedItem,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: ItemDetails(
            isInTabletLayout: true,
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    var shortestSide = MediaQuery.of(context).size.shortestSide;

    if (shortestSide < kTabletBreakpoint) {
      content = _buildMobileLayout();
    } else {
      content = _buildTabletLayout();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('ADMIN DASHBOARD',
                style: GoogleFonts.asap(
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffFF5454),
                    fontSize: 20.sp)),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: content,
    );
  }
}
