import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../base_view.dart';
import '../base_viewmodel.dart';
import 'viewmodel.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedViewModel>(
      onModelReady: (model) =>
          model.getPosts(Provider.of<User>(context).id.toString()),
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: model.feed.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => model.navigateToEntry(index),
                    child: Text(model.feed[index].description)),
              ),
      ),
    );
  }
}
