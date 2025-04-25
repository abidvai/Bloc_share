
import 'package:firebase_demo/controllers/post_controller.dart';
import 'package:firebase_demo/data/repositories/post_repository.dart';
import 'package:get/get.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostRepository>(() => PostRepository());
    Get.lazyPut<PostController>(() => PostController());
  }

}