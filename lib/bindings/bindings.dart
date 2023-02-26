import 'package:get/get.dart';
import 'package:tasker/controllers/task_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
  }
}
