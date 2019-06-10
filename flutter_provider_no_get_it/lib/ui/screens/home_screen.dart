import 'package:flutter/material.dart';
import 'package:flutter_provider_no_get_it/core/enums/view_state.dart';
import 'package:flutter_provider_no_get_it/core/models/post.dart';
import 'package:flutter_provider_no_get_it/core/models/user.dart';
import 'package:flutter_provider_no_get_it/core/viewmodels/home_model.dart';
import 'package:flutter_provider_no_get_it/ui/screens/base_screen.dart';
import 'package:flutter_provider_no_get_it/ui/shared/app_colors.dart' as colorsApp;
import 'package:flutter_provider_no_get_it/ui/shared/text_styles.dart';
import 'package:flutter_provider_no_get_it/ui/shared/ui_helpers.dart';
import 'package:flutter_provider_no_get_it/ui/widgets/post_list_item.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return BaseScreen<HomeModel>(
      onModelReady: (model) => model.getPosts(user.id),
      builder: (context, model, child) => Scaffold(
            backgroundColor: colorsApp.backgroundColor,
            body: model.state == ViewState.Busy
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      UIHelper.verticalSpaceLarge(),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Welcome ${user.name}',
                          style: headerStyle,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          'Here are all your posts',
                          style: subHeaderStyle,
                        ),
                      ),
                      UIHelper.verticalSpaceSmall(),
                      Expanded(
                        child: getPostUI(model.posts),
                      ),
                    ],
                  ),
          ),
    );
  }

  Widget getPostUI(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
              post: posts[index],
              onTap: () {
                Navigator.pushNamed(context, 'post', arguments: posts[index]);
              },
            ),
      );
}
