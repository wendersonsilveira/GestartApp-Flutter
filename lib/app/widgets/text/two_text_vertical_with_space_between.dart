import 'dart:ui';

import 'package:flutter/material.dart';

class TwoTextVerticalSpaceBetween extends StatelessWidget {
  final String textTitle;
  final String textMessage;
  final bool paddingVertical;
  final bool paddingHorizontal;

  const TwoTextVerticalSpaceBetween(
      {Key key,
      @required this.textTitle,
      this.textMessage,
      this.paddingVertical = true,
      this.paddingHorizontal = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double vertical = paddingVertical ? 10.0 : 0;
    double horizontal = paddingHorizontal ? 16 : 0;
    return Container(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textTitle),
          Text(
            textMessage != null ? textMessage : '--',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
