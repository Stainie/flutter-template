import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

closeApp() {
  exit(0);
}

double scaledWidth(double unscaledSize, BuildContext context) {
  // width in design examples
  return unscaledSize * (MediaQuery.of(context).size.width / 375);
}

double scaledHeight(double unscaledSize, BuildContext context) {
  // height in design examples
  return (unscaledSize) * (MediaQuery.of(context).size.height / 684);
}

String getTime(BuildContext context, TimeOfDay time) {
  return time.format(context);
}

String getDateDetails(DateTime time) {
  return DateFormat('yyyy-MMM-dd').format(time);
}

void printWrapped(String text) {
  // for printing long responses
  final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
