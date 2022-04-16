import 'package:flutter/material.dart';

import 'item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({
    required this.isInTabletLayout,
    required this.item,
  });

  final bool isInTabletLayout;
  final Item? item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        item!.widget,
      ],
    );

    if (isInTabletLayout) {
      return Center(child: content);
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(item!.title),
      // ),
      body: Center(child: content),
    );
  }
}
