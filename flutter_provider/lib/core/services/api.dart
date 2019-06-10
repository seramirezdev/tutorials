import 'dart:convert';

import 'package:flutter_provider/core/models/comment.dart';
import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/core/models/user.dart';
import 'package:http/http.dart' as http;

/// The service responsible for networking requests
class Api {
  static const _endpoint = 'https://jsonplaceholder.typicode.com';

  var _client = new http.Client();

  Future<User> getUserProfile(int userId) async {
    // Get user profile for id
    var response = await _client.get('$_endpoint/users/$userId');
    
    Map userJson = json.decode(response.body);
    User user;

    if (userJson.isNotEmpty)
      user = User.fromJson(userJson);
    
    return user;
  }

  Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    // Get user posts for id
    var response = await _client.get('$_endpoint/posts?userId=$userId');

    // parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // loop and convert each item to Post
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();

    // Get comments for post
    var response = await _client.get('$_endpoint/comments?postId=$postId');

    // Parse into List
    var parsed = json.decode(response.body) as List<dynamic>;

    // Loop and convert each item to a Comment
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }

    return comments;
  }

  void dispose() {
    _client.close();
  }
}
