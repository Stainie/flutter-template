import 'package:flutter/material.dart';
import 'package:flutter_template/ui/views/base_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../../models/user.dart';
import '../../style/colors.dart';
import '../base_view.dart';
import 'viewmodel.dart';

class UserView extends StatefulWidget {
  const UserView({Key key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<UserViewModel>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: lightGrey,
              body: Center(
                child: TextField(
                  controller: _textEditingController,
                ),
              ),
              floatingActionButton: FloatingActionButton(
                  child: model.state == ViewState.Busy
                      ? CircularProgressIndicator()
                      : Text("button"),
                  onPressed: () async {
                    var success = await model
                        .authenticateUser(_textEditingController.text);

                    if (success) Navigator.pushNamed(context, 'post');
                  }),
            ));
  }
}
