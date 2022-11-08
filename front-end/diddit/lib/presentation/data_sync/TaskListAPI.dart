import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/core/utils/validation_functions.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/widgets/custom_text_form_field.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math' as math;

class TaskListAPI {
  final int id;
  final String input;
  static String uri = "http://127.0.0.1:5000";

  TaskListAPI({required this.id, required this.input});

  factory TaskListAPI.fromJson(Map<String, dynamic> json) {
    return TaskListAPI(
      id: json['id'],
      input: json['input'],
    );
  }

  static sendLogin(String email, String password, BuildContext context) async {
    final response = await http.post(
      // ENDPOINT NEEDS TO BE RUNNING
      Uri.parse(uri + '/login'),
      headers: <String, String>{
        'Content-Type': 'multipart/form-data', // multipart/form-data
      },
      // NEEDS TO RETURN MULTIPART/FORM DATA NOT JSON
      // and jwt token?
      body: jsonEncode(<String, String>{
        'username': email,
        'password': password,
      }),
    );

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpcomingScreen()),
      );
    }
  }

  static sendRegister(
      String email, String password, BuildContext context) async {
    print(email);
    print(password);

    final response = await http.post(
      // PARSE URL
      Uri.parse(uri + '/login'),
      // HEADER OF RESPONSE
      headers: <String, String>{
        'Content-Type': 'multipart/form-data',
      },
      // BODY OF RESPONSE
      body: jsonEncode(<String, dynamic>{
        'username': email,
        'password': password,
      }),
    );
    print(response.statusCode);
    print(response.body);
    // 200 means response was received and is being processed,
    // 201 means response was successfully CREATED
    if (response.statusCode == 200 || response.statusCode == 201) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => UpcomingScreen()),
      );
      //return TaskListAPI.fromJson(jsonDecode(response.body));
    }
    // ELSE THROW EXCEPTION
    else {
      throw Exception('Failed to create album.');
    }
  }

  dynamic fetchTasks() async {
    final response = await http.get(Uri.parse(uri + '/refresh'));

    // if there is a response
    if (response.statusCode == 200) {
      // decode into map (json) object
      Map<String, dynamic> taskInfo = jsonDecode(response.body);
      print(taskInfo); // this is a json now
      int numTasks = taskInfo.length;
      print(numTasks);
      List<Task> taskList = []; // initializes list object
      int taskIndex = 0;

      // for each key in the taskInfo json object
      taskInfo.forEach((key, value) {
        taskIndex = taskIndex + 1;
        // add the value of the key (the task in json), creates task object using its values
        taskList.add(Task(
            className: value['Class'],
            assignmentName: value['Name'],
            teacherDesc: value['Description Teacher'],
            studentDesc: value['Description Student'],
            classColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                .withOpacity(1.0),
            dueDate: value['Due Date'],
            dueTime: value['Due Time'],
            markedDone: value['Marked Done'],
            isLast: taskIndex == (numTasks) ? true : false));
      });
      print(taskList); // works, taskList.runtimeType is List<Task>

      return taskList; // returns list of Tasks
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}

class ChangeIpButton extends StatelessWidget {
  final String text;
  const ChangeIpButton(this.text);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        padding: const EdgeInsets.all(14.0),
        textStyle: const TextStyle(fontSize: 18),
      ),
      child: Text(""),
      onLongPress: () => {
        CustomTextFormField(
          width: 64,
          focusNode: FocusNode(),
          margin: getMargin(
            left: 20,
            top: 20,
            right: 20,
          ),
          textInputAction: TextInputAction.done,
          isObscureText: true,
        ),
      },
      onPressed: () {},
    );
  }
}

class Task {
  String? className;
  String? assignmentName;
  String? difficulty; // difficulty tag
  String? dueTime;
  String? dueDate;
  String? studentDesc;
  String? teacherDesc;
  Color? classColor;
  List<Map<String, dynamic>>? desc; // we might only need this?? not sure
  // indicates whether it's the last item of the list, which will be used to add to list
  bool isLast; // defaults to false in constructor
  bool markedDone;

  // class constructor
  Task(
      {this.className,
      this.assignmentName,
      this.difficulty,
      this.teacherDesc,
      this.studentDesc,
      this.dueDate,
      this.dueTime,
      this.classColor,
      this.markedDone = false,
      this.isLast = false});
}
