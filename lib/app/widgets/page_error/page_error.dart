import 'package:Gestart/app/styles/app_text_theme.dart';
import 'package:Gestart/app/widgets/buttons/contained_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageError extends StatelessWidget {
  final String messageError;
  final Function onPressed;

  const PageError({Key key, this.messageError, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/error.png',
            height: 60,
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            messageError != null
                ? messageError
                : 'Ocorreu um erro, tente novamente.',
            textAlign: TextAlign.center,
            style: AppTextTheme.messageError,
          ),
          SizedBox(
            height: 16.h,
          ),
          ContainedButtonWidget(text: "Tentar novamente", onPressed: onPressed)
        ],
      ),
    );
  }
}
