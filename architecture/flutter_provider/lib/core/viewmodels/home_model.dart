import 'package:flutter_provider/core/enums/view_state.dart';
import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/core/services/posts_service.dart';
import 'package:flutter_provider/core/viewmodels/base_model.dart';
import 'package:flutter_provider/locator.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = locator<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
