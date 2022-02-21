import 'package:Gestart/app/modules/login/forgot_password/forgot_password_page.dart';

import 'forgot_password/forgot_password_controller.dart';
import 'package:Gestart/app/constants/route_name.dart';
import 'package:Gestart/app/modules/login/sign_up/sign_up_page.dart';

import 'sign_up/sign_up_controller.dart';
import 'sign_in/sign_in_controller.dart';
import 'sign_in/sign_in_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => ForgotPasswordController()),
        Bind((i) => SignUpController()),
        Bind((i) => SignInController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => SignInPage()),
        ChildRoute(RouteName.signup,
            child: (_, args) => SignUpPage(cpfCnpj: args.data)),
        ChildRoute(RouteName.forgot_password,
            child: (_, args) => ForgotPasswordPage()),
      ];

  // //static Inject get to => Inject<LoginModule>.of();
}
