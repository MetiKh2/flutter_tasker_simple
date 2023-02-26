import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasker/constants.dart';
import 'package:tasker/controllers/task_controller.dart';
import 'package:tasker/main.dart';
import 'package:tasker/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  static TextEditingController subController = TextEditingController();
  static TextEditingController titleController = TextEditingController();
  static int index = -1;
  @override
  Widget build(BuildContext context) {
    MyApp.changeColor(Colors.white, Brightness.light);
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyAppBar(),
          TitleWidget(),
          TaskTextField(),
          NoteWidget(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: Get.width - 10,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    print(index);
                    var task = Task(
                        status: false,
                        title: titleController.text,
                        subTitle: subController.text);
                    if (index >= 0) {
                      Get.find<TaskController>().tasks[index] = task;
                    } else {
                      Get.find<TaskController>().tasks.add(task);
                    }
                    subController.text = '';
                    titleController.text = '';
                    Get.back();
                  },
                  child: Text('Submit'),
                  style: TextButton.styleFrom(backgroundColor: Colors.purple),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: TextField(
        controller: AddTaskScreen.titleController,
        maxLength: 30,
        cursorColor: kLightBlueColor,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.bookmark_border,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          counter: Container(),
          hintText: 'Add note',
        ),
      ),
    );
  }
}

class TaskTextField extends StatelessWidget {
  const TaskTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: AddTaskScreen.subController,
        maxLines: 6,
        cursorColor: kLightBlueColor,
        cursorHeight: 40,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10),
      child: Text(
        'What are you planning ?',
        style: TextStyle(color: Colors.grey[600], fontSize: 16),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 10, left: 50),
                child: const Text(
                  'Task',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ))),
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close))
      ],
    );
  }
}
