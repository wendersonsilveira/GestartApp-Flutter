import 'dart:ui';

import 'package:flutter/material.dart';

class TwoTextHorizontalSpaceBetween extends StatelessWidget {
  final String textLeft;
  final String textRight;
  final bool paddingVertical;
  final bool paddingHorizontal;

  const TwoTextHorizontalSpaceBetween(
      {Key key,
      @required this.textLeft,
      this.textRight,
      this.paddingVertical = true,
      this.paddingHorizontal = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double vertical = paddingVertical ? 10.0 : 0;
    double horizontal = paddingHorizontal ? 16 : 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(textLeft),
          Text(
            textRight != null ? textRight : '--',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
