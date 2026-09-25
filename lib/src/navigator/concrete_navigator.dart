import "dart:io";

import "package:flutter/cupertino.dart" as cupertino;
import "package:flutter/material.dart" as material;
import "package:flutter/widgets.dart" as widgets;
import "package:teresa/src/navigator/abstract_navigator.dart";

class ConcreteNavigator implements AbstractNavigator {
  @override
  void navigate(widgets.BuildContext context, widgets.Widget screen) {
    final widgets.Widget Function(widgets.BuildContext) builder = (_) {
      return screen;
    };
    late final widgets.Route route = Platform.isIOS
        ? cupertino.CupertinoPageRoute(builder: builder)
        : material.MaterialPageRoute(builder: builder);

    widgets.Navigator.push(context, route);
  }

  @override
  void navigateBack(widgets.BuildContext context) {
    widgets.Navigator.pop(context);
  }
}
