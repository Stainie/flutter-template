import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
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
                    child: Text(model.state.feed[index].description +
                        '\n' +
                        model.computed.first.name)),
              ),
      ),
      viewModelBuilder: () => FeedViewModel(),
      onModelReady: (model) => model.getPosts(),
    );
  }
}
