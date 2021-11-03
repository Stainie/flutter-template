import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'feed_viewmodel.dart';

/*
Steps to enable a View to reflect state in a ReactiveViewModel

1. Use the ReactiveViewModel type as a type parameter in the ViewModelBuilder
widget constructor. In this example FeedView will reflect state in a FeedViewModel.
The View is the result of the 'builder' function.

2. Use the 'reactive' variant of the ViewModelBuilder constructor to enable the View
to react to ReactiveViewModel changes. The 'reactive' constructor will rebuild a View
when 'notifyListeners' is called in the ReactiveViewModel. The 'nonReactive' constructor
(used in the UserViewModel in this project) won't.

NOTE: in FeedViewModel, there is no need to call notifyListeners explicitly since
it is called automatically when a listened-to Service indicates a change - it's
part of the ReactiveViewModel 'super' class. See the 'indicateChange' function in
the ReactiveViewModel source.

3. Use the 'getters' defined in the ReactiveViewModel to reflect state in the widgets.
In this example, 'model.feed' is used to access the feed items retrieved in FeedViewModel
and model.userName is used to reflect the user's name from the global app state.

*/
class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          body: Column(children: <Widget>[
        model.isBusy
            ? CircularProgressIndicator()
            : ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.feed.length,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () => model.navigateToEntry(index),
                    child: Text(model.feed[index].description ?? "")),
              ),
        Text('USER: ' + model.userName)
      ])),
      viewModelBuilder: () => FeedViewModel(),
    );
  }
}
