import 'package:flutter/material.dart';
import 'package:training_app_5/models/task.dart';

class TaskWidget extends StatelessWidget {
  Task task;

  TaskWidget(this.task);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(value: task.isComplete,
      onChanged: (v) {},title: Text(task.name),);
  }
}
