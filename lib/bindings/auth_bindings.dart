

import 'package:firebase_demo/controllers/auth_controller.dart';
import 'package:firebase_demo/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepository());

    Get.put<AuthController>(AuthController(), permanent: true);
  }

}