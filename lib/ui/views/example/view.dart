import 'package:flutter/material.dart';

import '../../style/colors.dart';
import '../base_view.dart';
import 'viewmodel.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({Key key}) : super(key: key);

  @override
  _ExampleViewState createState() => _ExampleViewState();
}

class _ExampleViewState extends State<ExampleView> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<ExampleViewModel>(
        onModelReady: (model) {
          // initial call on the model
        },
        builder: (context, model, child) => Scaffold(
              backgroundColor: lightGrey,
              body: Center(
                child: TextField(
                  controller: _textEditingController,
                ),
              ),
              floatingActionButton: FloatingActionButton(onPressed: () async {
                await model.getExample(_textEditingController.text);

                Navigator.pushNamed(context, '/');
              }),
            ));
  }
}
