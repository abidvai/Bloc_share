import 'package:firebase_demo/controllers/auth_controller.dart';
import 'package:firebase_demo/controllers/post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/post_card.dart';

class HomePage extends StatelessWidget {
  final PostController _postController = Get.put(PostController());
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              _authController.logout();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
          onPressed: () => Get.toNamed('/create-post')),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            _buildWelcomeHeader(),
            SizedBox(height: 10),
            Expanded(child: _buildPostList()),
          ],
        ),
      ),
    );
  }

  // Welcome message with user email
  Widget _buildWelcomeHeader() {
    return Obx(() {
      final user = _authController.user.value;
      return Card(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            user != null
                ? "Hello, ${user.email!.split('@')[0]}! 👋"
                : "Hello, Guest!",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    });
  }

  // Post list with real-time updates
  Widget _buildPostList() {
    return Obx(() {
      if (_postController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (_postController.posts.isEmpty) {
        return Center(child: Text("No posts yet. Create one!"));
      }
      return RefreshIndicator(
        onRefresh: () => _postController.fetchPosts(),
        child: ListView.builder(
          itemCount: _postController.posts.length,
          itemBuilder: (ctx, index) {
            final post = _postController.posts[index];
            return PostCard(post: post, Postcontroller: _postController); // Reusable widget
          },
        ),
      );
    });
  }
}
