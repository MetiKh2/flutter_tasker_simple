import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/constants.dart';
import 'package:tasker/main.dart';
import 'package:tasker/pages/add_task_screen.dart';

import '../controllers/task_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(kLightBlueColor, Brightness.light);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AddTaskScreen.subController.text = '';
          AddTaskScreen.titleController.text = '';
          AddTaskScreen.index = -1;
          Get.toNamed('/addScreen')?.then(
              (value) => MyApp.changeColor(kLightBlueColor, Brightness.light));
        },
        backgroundColor: kLightBlueColor,
        elevation: 0,
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
          child: Stack(
        alignment: Alignment.bottomCenter,
        children: [TopSectionWidget(), BottomSectionWidget()],
      )),
    );
  }
}

class BottomSectionWidget extends StatelessWidget {
  const BottomSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.6,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Container(
          margin: const EdgeInsets.only(left: 50, right: 10, top: 20),
          child: Obx(
            () => ListView.separated(
                itemBuilder: (context, index) {
                  var task = Get.find<TaskController>().tasks[index];
                  return ListTile(
                    onLongPress: () {
                      Get.find<TaskController>().tasks.removeAt(index);
                    },
                    title: Text(Get.find<TaskController>()
                        .tasks[index]
                        .title
                        .toString()),
                    subtitle: Text(Get.find<TaskController>()
                        .tasks[index]
                        .subTitle
                        .toString()),
                    onTap: () {
                      AddTaskScreen.subController.text =
                          Get.find<TaskController>()
                              .tasks[index]
                              .subTitle
                              .toString();
                      AddTaskScreen.titleController.text =
                          Get.find<TaskController>()
                              .tasks[index]
                              .title
                              .toString();
                      AddTaskScreen.index = index;
                      Get.toNamed('/addScreen');
                    },
                    trailing: Checkbox(
                      onChanged: (value) {
                        task.status = !task.status!;
                        Get.find<TaskController>().tasks[index] = task;
                      },
                      value: Get.find<TaskController>().tasks[index].status,
                      side: const BorderSide(color: Colors.black45, width: 1.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                      color: Colors.black45,
                      height: 0.5,
                    ),
                itemCount: Get.find<TaskController>().tasks.length),
          )),
    );
  }
}

class TopSectionWidget extends StatelessWidget {
  const TopSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      color: kLightBlueColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.arrow_back_ios)),
                IconButton(
                    onPressed: () {},
                    color: Colors.white,
                    icon: const Icon(Icons.menu))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 40, top: 20),
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.bookmarks,
                color: kLightBlueColor,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 50, top: 20),
            child: const Text(
              'All',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(left: 50, top: 5),
              child: Obx(
                () => Text(
                  '${Get.find<TaskController>().tasks.length} Tasks',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ))
        ],
      ),
    );
  }
}
