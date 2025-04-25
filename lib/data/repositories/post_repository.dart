import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/bindings/auth_bindings.dart';
import 'package:firebase_demo/data/models/post_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PostRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ///--------------- Fetch All post (one-time) -------------///
  Future<List<Post>> getPosts() async {
    try {
      final snapshot = await _firestore
          .collection('posts')
          .orderBy('createdAt', descending: true)
          .get();
      return snapshot.docs.map((doc) => Post.fromSnapshot(doc)).toList();
    }catch(e) {
      Get.snackbar('Error', 'Failed to fetch posts');
      rethrow;
    }
  }

  /// --------- Stream post (one-time) ------------///
  Stream<List<Post>> streamPosts() {
    return _firestore
        .collection('posts')
        .orderBy('createdAt' , descending:  true)
        .snapshots()
        .map((snapshot) =>
                snapshot.docs.map((doc) => Post.fromSnapshot(doc)).toList());
  }

  /// ----------- create a new post ------------///
  // Create a new post
  Future<void> createPost({
    required String title,
    required String content,
    required String authorId,
  }) async {
    try {
      await _firestore.collection('posts').add({
        'title': title,
        'content': content,
        'authorId': authorId,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      Get.snackbar("Error", "Failed to create post");
      rethrow;
    }
  }
}

