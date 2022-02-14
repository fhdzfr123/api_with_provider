
import 'package:api_with_provider/Model/postmodel.dart';
import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier{
  List<Post> _posts = [];

  List<Post> get posts => _posts;

  void addPost(Post post) {
    _posts.add(post);
    notifyListeners();
  }
}
