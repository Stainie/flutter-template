import 'package:flutter/material.dart';
import 'package:flutter_template/models/user.dart';
import 'package:flutter_template/ui/views/base_view.dart';
import 'package:flutter_template/ui/views/base_viewmodel.dart';
import 'package:flutter_template/ui/views/feed/viewmodel.dart';
import 'package:provider/provider.dart';

class FeedView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FeedModel>(
      onModelReady: (model) =>
          model.getPosts(Provider.of<User>(context).id.toString()),
      builder: (context, model, child) => Scaffold(
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : ListView(
                children: [],
              ),
      ),
    );
  }
}
