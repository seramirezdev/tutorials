import 'package:flutter/material.dart';
import 'package:flutter_provider/core/viewmodels/like_button_model.dart';

import 'package:flutter_provider/ui/screens/base_screen.dart';

class LikeButton extends StatelessWidget {
  final int postId;
  const LikeButton({Key key, this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen<LikeButtonModel>(
      builder: (context, model, child) => Row(
            children: <Widget>[
              Text('Likes ${model.postLikes(postId)}'),
              MaterialButton(
                color: Colors.white,
                child: Icon(Icons.thumb_up),
                onPressed: () {
                  model.increaseLikes(postId);
                },
              ),
            ],
          ),
    );
  }
}
