import 'package:flutter/material.dart';
import 'package:flutter_provider/core/models/post.dart';
import 'package:flutter_provider/core/models/user.dart';
import 'package:flutter_provider/ui/shared/app_colors.dart' as colorsApp;
import 'package:flutter_provider/ui/shared/text_styles.dart';
import 'package:flutter_provider/ui/shared/ui_helpers.dart';
import 'package:flutter_provider/ui/widgets/commets.dart';
import 'package:flutter_provider/ui/widgets/like_button.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatelessWidget {
  final Post post;
  PostScreen({this.post});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: colorsApp.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${user.name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(postId: post.id),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
