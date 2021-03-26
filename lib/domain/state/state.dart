import 'package:get/get.dart';

enum ScreenState { IDLE, WAITING }

class IState extends GetxController {
  var _status = ScreenState.IDLE.obs;

  ScreenState? get state => _status.value;

  void setState(ScreenState state) => _status.value = state;
}
