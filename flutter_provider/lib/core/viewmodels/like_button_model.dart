import 'package:flutter_provider/core/services/posts_service.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/locator.dart';

class LikeButtonModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  int postLikes(int postId) =>
      _postsService.posts.firstWhere((post) => post.id == postId).likes;

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    notifyListeners();
  }
}
