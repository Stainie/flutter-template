import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../base_view.dart';
import '../base_viewmodel.dart';
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
                    await model.authenticateUser(_textEditingController.text);
                  }),
            ));
  }
}
