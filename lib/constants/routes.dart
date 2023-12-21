import 'package:flutter/material.dart';

class Routes {
  static Routes instance = Routes();

  Future<dynamic> pushAndRemoveUntil(Widget widget, BuildContext context) {
    return Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );
  }

  Future<dynamic> push(Widget widget, BuildContext context) {
    print("Pushing widget: $widget");
    return Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => widget));
  }
}
