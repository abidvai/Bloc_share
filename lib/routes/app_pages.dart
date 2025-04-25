import 'package:firebase_demo/bindings/auth_bindings.dart';
import 'package:firebase_demo/bindings/post_bindings.dart';
import 'package:firebase_demo/modules/auth/views/login_view.dart';
import 'package:firebase_demo/modules/auth/views/signup_view.dart';
import 'package:firebase_demo/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.LOGIN,
        page: () => LoginPage(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.SIGNUP,
        page: ()=> SignupPage(),
        binding: AuthBinding()
    ),
    GetPage(
        name: Routes.HOME,
        page: ()=> HomePage(),
        bindings: [
          PostBinding(),
          AuthBinding()
        ],
    )
  ];
}
