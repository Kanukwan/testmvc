import 'package:mvc_pattern/mvc_pattern.dart';

class ControllerWidget extends ControllerMVC {
  factory ControllerWidget([StateMVC? state]) =>
      _this ??= ControllerWidget._(state);
  ControllerWidget._(StateMVC? state) : super(state);
  static ControllerWidget? _this;

  int? selectTabIndex = 0;

  // Change Tab
  void onItemTapped(int? index) {
    setState(() {
      selectTabIndex = index;
    });
  }
}
