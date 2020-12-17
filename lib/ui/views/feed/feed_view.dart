import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../models/user.dart';
import 'feed_viewmodel.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: model.isBusy
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: model.state.feed.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => model.navigateToEntry(index),
                    child: Text(model.state.feed[index].description)),
              ),
      ),
      viewModelBuilder: () => FeedViewModel(),
      onModelReady: (model) => model.getPosts(model.state.user.id.toString()),
    );
  }
}
