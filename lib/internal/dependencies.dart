import 'package:comp_math_lab3/domain/controllers/drawing_controller.dart';
import 'package:comp_math_lab3/domain/state/main_screen_state.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<DrawingController>(DrawingController());
    Get.put<MainScreenState>(MainScreenState());
  }
}
