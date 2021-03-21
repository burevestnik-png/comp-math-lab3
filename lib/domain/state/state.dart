import 'package:flutter/cupertino.dart';

enum ScreenState { IDLE, WAITING }

class IState with ChangeNotifier {
  ScreenState _status = ScreenState.IDLE;

  ScreenState get state => _status;

  void setState(ScreenState state) {
    _status = state;
    notifyListeners();
  }
}
