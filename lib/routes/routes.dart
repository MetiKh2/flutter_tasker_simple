import 'package:get/get.dart';
import 'package:tasker/pages/add_task_screen.dart';
import 'package:tasker/pages/home_screen.dart';

class Routes {
  static List<GetPage> get pages => [
        GetPage(name: '/homeScreen', page: () => HomeScreen()),
        GetPage(name: '/addScreen', page: () => AddTaskScreen()),
      ];
}
