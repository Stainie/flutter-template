import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import 'user_viewmodel.dart';

class UserView extends StatefulWidget {
  const UserView({Key? key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.nonReactive(
        viewModelBuilder: () => UserViewModel(),
        builder: (context, model, child) => Scaffold(
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[_TextInput(), _CurrentUsername()],
              )),
              floatingActionButton: FloatingActionButton(
                  child: model.isBusy
                      ? CircularProgressIndicator()
                      : Text("button"),
                  onPressed: () async {
                    await model.authenticateUser();
                  }),
            ));
  }
}

class _TextInput extends StackedHookView<UserViewModel> {
  const _TextInput({Key? key}) : super(key: key, reactive: false);

  @override
  Widget builder(BuildContext context, UserViewModel model) {
    var controller = useTextEditingController();
    return TextField(
      controller: controller,

      //  No logic in views except references to event functions (like here)
      // and pipes (if implemented)
      onChanged: model.setUsername,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'User Name',
      ),
    );
  }
}

class _CurrentUsername extends StackedHookView<UserViewModel> {
  const _CurrentUsername({Key? key}) : super(key: key, reactive: true);

  @override
  Widget builder(BuildContext context, UserViewModel model) =>
      Text(model.username);
}
