import 'package:flutter_provider_no_get_it/core/enums/view_state.dart';
import 'package:flutter_provider_no_get_it/core/models/comment.dart';
import 'package:flutter_provider_no_get_it/core/services/api.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/base_model.dart';
import 'package:flutter_provider_no_get_it/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
