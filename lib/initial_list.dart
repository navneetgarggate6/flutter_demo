import 'package:filter_menu/task.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


List<Task> tasks = [];

Future<List> getJson() async {
  String apiUrl = 'https://jsonplaceholder.typicode.com/todos?userId=1';
  http.Response response = await http.get(apiUrl);
  // return json.decode(response.body).toString();
  return json.decode(response.body);
}

Future<List<Task>> getTask() async {
  if (tasks.length == 0) {
    List _data = await getJson();
    for (var i = 0; i < _data.length; i++) {
      tasks.add(new Task(
          id: _data[i]["id"],
          name: _data[i]["title"],
          category: _data[i]["completed"] ? 'Completed' : 'Pending',
          time: "ID : " + _data[i]["id"].toString(),
          color: _data[i]["completed"] ? Colors.cyan : Colors.pink,
          completed: _data[i]["completed"]));
    }
  }
  return tasks;
}
