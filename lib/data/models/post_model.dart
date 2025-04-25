import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String id;
  final String title;
  final String content;
  final String authId;
  final DateTime createdAt;

  Post(
      {required this.id,
      required this.title,
      required this.content,
      required this.authId,
      required this.createdAt});

  /// ------------ Convert firebase document to Post object ---------------- ///
  factory Post.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Post(
      id: doc.id,
      title: data['title'] ?? '',
      content: data['content'] ?? '',
      authId: data['authId'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }
}
