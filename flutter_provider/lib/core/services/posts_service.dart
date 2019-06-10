import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/core/services/api.dart';
import 'package:flutter_provider/locator.dart';

class PostsService {

  Api _api = locator<Api>();

  List<Post> _posts;
  List<Post> get posts => _posts;

  Future getPostsForUser(int userId) async {
    _posts = await _api.getPostsForUser(userId);
  }

  void incrementLikes(int postId) {
    _posts.firstWhere((post) => post.id == postId).likes++;
  }
}