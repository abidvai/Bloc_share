import 'package:firebase_demo/controllers/post_controller.dart';
import 'package:flutter/material.dart';

import '../data/models/post_model.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post, required PostController Postcontroller});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(post.content),
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.person, size: 14),
                const SizedBox(width: 4),
                Text(
                  post.authId, // Replace with user name if available
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const Spacer(),
                const Icon(Icons.access_time, size: 14),
                const SizedBox(width: 4),
                Text(
                  _formatDate(post.createdAt),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}