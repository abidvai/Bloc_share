
import 'package:firebase_demo/controllers/auth_controller.dart';
import 'package:firebase_demo/data/models/post_model.dart';
import 'package:firebase_demo/data/repositories/post_repository.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostRepository _postRepo = Get.find();
  final RxList<Post> posts = <Post>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    isLoading.value = true;
    try {
      posts.assignAll(await _postRepo.getPosts());
    } finally {
      isLoading.value = false;
    }
  }

  Stream<List<Post>> streamPosts() => _postRepo.streamPosts();

  Future<void> createPost(String title, String content) async {
    try {
      await _postRepo.createPost(title: title,
          content: content,
          authorId: Get.find<AuthController>().user.value!.uid
      );
      Get.back();
      Get.snackbar('success', 'Post created');
    }catch(e) {
      Get.snackbar('Error', e.toString());
    }
  }
}