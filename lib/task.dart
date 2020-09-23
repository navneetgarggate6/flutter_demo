import 'package:flutter/material.dart';

class Task {
  final int id;
  final String name;
  final String category;
  final String time;
  final Color color;
  final bool completed;

  Task(
      {this.id,
      this.name,
      this.category,
      this.time,
      this.color,
      this.completed});
}
