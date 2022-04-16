import 'package:birddie_admin/ui/events_screen.dart';
import 'package:birddie_admin/ui/match_screen.dart';
import 'package:birddie_admin/ui/verification_screen.dart';
import 'package:flutter/material.dart';

class Item {
  Item({
    required this.title,
    //required this.subtitle,
    required this.widget,
  });

  final String title;
  // final String subtitle;
  final Widget widget;
}

final List<Item> items = <Item>[
  Item(widget: MatchScreen(), title: 'MATCH'),
  Item(widget: VerificationScreen(), title: 'VERIFICATION'),
  Item(widget: const DATES(), title: 'DATES'),
];
