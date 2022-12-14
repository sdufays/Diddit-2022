import 'dart:convert'; // lets you use json stuff
import 'dart:core';
import 'dart:io';
import 'package:diddit_final/presentation/completed_screen/completed_screen.dart';
import 'package:diddit_final/presentation/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/services.dart';
import 'controller/upcoming_controller.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:diddit_final/presentation/assignment_screen/assignment_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:math' as math;
import 'package:http/http.dart' as http;
import 'package:diddit_final/presentation/data_sync/TaskListAPI.dart';

/* unused files
import '../upcoming_screen/widgets/listclassname_item_widget.dart';
import '../upcoming_screen/widgets/listclassname_three_item_widget.dart';
import 'models/listclassname_item_model.dart';
import 'models/listclassname_three_item_model.dart';
*/

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  late Future<dynamic> futureTaskList;
  TaskListAPI taskManager = TaskListAPI(id: 0, input: "");

  bool value = false;
  void changeData() {
    setState(() {
      value = true;
    });
  }

  @override
  void initState() {
    super.initState();
    futureTaskList = taskManager.fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      /// APP BAR, SAME ON EVERY PAGE SO MAYBE I SHOULD MAKE IT AN INDEPENDENT WIDGET LOL
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 213, 114, 231),
          elevation: 0,
          //leading: IconButton(
          //icon: Icon(Icons.arrow_back_ios),
          //onPressed: () => Navigator.of(context).pop(),
          //),
          actions: <Widget>[
            //Icon(Icons.home),
            IconButton(
                icon: Icon(Icons.check_box),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedScreen()))
                    }),
          ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(
              height: 64.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 213, 114, 231),
                ),
                //margin: EdgeInsets.all(0.0),
                //padding: EdgeInsets.all(0.0),
                child: Text(
                  'Diddit',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              title: const Text('Log out'),
              onTap: () => {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()))
              },
            ),
            //ListTile(
            //title: const Text('Item 2'),
            //onTap: () {
            // Update the state of the app
            // ...
            // Then close the drawer
            //Navigator.pop(context);
            //},
            //),
          ],
        ),
      ),

      /// PAGE COLOR
      backgroundColor: ColorConstant.purple50,

      /// ACTUAL CONTENT STARTS HERE--------------------------
      body: Column(
        children: [
          // UPCOMING PAGE TITLE
          AppBar(
            title: Center(
              child: Text(
                "Upcoming Assignments",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),

          // LIST STARTS HERE
          Expanded(
            child: FutureBuilder<dynamic>(
              future: futureTaskList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var taskList = snapshot.data;
                  print(taskList);
                  print(taskList.length);
                  print(taskList[0].assignmentName);
                  return ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (BuildContext context, int index) =>
                        taskList[index].markedDone
                            ? _skipCompletedTask()
                            : taskList[index].isLast
                                ? _buildAddTask()
                                : _buildTask(context, taskList[index]),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return ListView.builder(
                    itemCount:
                        snapshot.data == null ? 0 : snapshot.data?.length,
                    itemBuilder: (BuildContext context, int index) =>
                        snapshot.data?[index].markedDone ?? Task().markedDone
                            ? _skipCompletedTask()
                            : snapshot.data?[index].isLast ?? Task().isLast
                                ? _buildAddTask()
                                : _buildTask(
                                    context, snapshot.data?[index] ?? Task()));
              },
            ),
          ),
        ],
      ),
    ));
  }

  Widget _skipCompletedTask() {
    return Text("");
  }

  Widget _buildAddTask() {
    return TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: () => {},
        child: Center(
            child: Text(
          '+ Add Task',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        )));
  }

  Widget _buildTask(BuildContext context, dynamic task) {
    return SingleChildScrollView(
      child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.purple.withOpacity(0.3),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(-2, 4), // changes position of shadow
                ),
              ],
            ),
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.className != null ? task.className! : "empty string",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: task.classColor,
                      ),
                    ),
                    Icon(
                      Icons.class_sharp,
                      color: task.classColor,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      task.assignmentName != null
                          ? task.assignmentName!
                          : "empty string",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      task.difficulty != null ? task.difficulty! : "Hard",
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time_filled),
                        Text(task.dueTime!)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          onTap: () async {
            bool refresh = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssignmentScreen(task)));
            if (refresh == true) {
              changeData();
            }
          }),
    );
  }
}

// class that defines the attributes of a task + creates a list of various tasks
// with different attributes
class Task {
  // ATTRIBUTES
  // "?" means it might be null
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

  // CONSTRUCTOR
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

// this gets and decodes json of tasks from Refresh
Future<List<Task>> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://localhost:5000/refresh'));

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
    print(taskList); // works

    return taskList; // returns list of Tasks
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
