import 'package:Gestart/app/styles/app_color_scheme.dart';
import 'package:flutter/material.dart';

class PageError extends StatelessWidget {
  final String messageError;
  final Function onPressed;

  const PageError({
    Key key,
    this.messageError,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy,
              size: 70,
              color: AppColorScheme.primaryColor,
            ),
            SizedBox(
              height: 30,
            ),
            Text(messageError),
          ],
        ),
      ),
    );
  }
}
