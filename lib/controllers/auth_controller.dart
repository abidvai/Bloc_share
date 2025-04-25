
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/data/repositories/auth_repository.dart';
import 'package:firebase_demo/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthRepository _authRepo = Get.find();
  final Rx<User?> user = Rx<User?>(null);
  final isLoading = false.obs;

  /// ---------------- Signup method --------------- ///
  Future<void> signUp(String email, String password) async {
    isLoading.value = true;
    try {
      final user = await _authRepo.signUp(email, password);
      if(user != null){
        Get.offAll(HomePage());
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Oops!', e.message ?? 'Signup failed');
    } finally {
      isLoading.value = false;
    }
  }

/// ---------------- Login method --------------- ///
  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try{
      final user = await _authRepo.login(email, password);
      if(user != null){
        Get.offAll(HomePage());
      }
    } on FirebaseAuthException catch(e) {
      Get.snackbar('Oops!', e.message ?? 'login failed');
    } finally {
      isLoading.value = false;
    }
  }
}