import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../style/colors.dart';
import 'user_viewmodel.dart';

class UserView extends StatefulWidget {
  const UserView({Key key}) : super(key: key);

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.nonReactive(
        builder: (context, model, child) => Scaffold(
              backgroundColor: lightGrey,
              body: Center(
                  child: Column(
                children: [_TextInput(), _CurrentUsername()],
              )),
              floatingActionButton: FloatingActionButton(
                  child: model.isBusy
                      ? CircularProgressIndicator()
                      : Text("button"),
                  onPressed: () async {
                    await model.authenticateUser();
                  }),
            ),
        viewModelBuilder: null);
  }
}

class _TextInput extends HookViewModelWidget<UserViewModel> {
  const _TextInput({Key key}) : super(key: key, reactive: false);

  @override
  Widget buildViewModelWidget(BuildContext context, UserViewModel viewModel) {
    var controller = useTextEditingController();
    return TextField(
      controller: controller,
      onChanged: viewModel.setUsername,
    );
  }
}

class _CurrentUsername extends HookViewModelWidget<UserViewModel> {
  const _CurrentUsername({Key key}) : super(key: key, reactive: true);

  @override
  Widget buildViewModelWidget(BuildContext context, UserViewModel viewModel) {
    return Text(viewModel.username ?? "");
  }
}
