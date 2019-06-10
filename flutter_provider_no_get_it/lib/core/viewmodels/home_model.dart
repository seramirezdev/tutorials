import 'package:flutter_provider_no_get_it/core/enums/view_state.dart';
import 'package:flutter_provider_no_get_it/core/models/post.dart';
import 'package:flutter_provider_no_get_it/core/services/api.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/base_model.dart';
import 'package:flutter_provider_no_get_it/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  } 
}