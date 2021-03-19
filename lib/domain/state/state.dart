import 'package:flutter/cupertino.dart';

enum ScreenState { IDLE, WAITING }

class IState with ChangeNotifier {
  ScreenState _state = ScreenState.IDLE;

  ScreenState get state => _state;

  void setState(ScreenState state) {
    _state = state;
    notifyListeners();
  }
}
