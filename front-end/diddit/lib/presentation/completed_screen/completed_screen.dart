import '../completed_screen/widgets/completed_item_widget.dart';
import 'controller/completed_controller.dart';
import 'models/completed_item_model.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:diddit_final/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';
import 'package:diddit_final/presentation/assignment_screen/assignment_screen.dart';
import 'package:diddit_final/presentation/data_sync/TaskListAPI.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  late Future<dynamic> futureTaskList;
  TaskListAPI taskManager = TaskListAPI(id: 0, input: "");

  bool value = true;
  void changeData() {
    setState(() {
      value = false;
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
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () => {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => new UpcomingScreen()))
                    }),
            IconButton(
                icon: Icon(Icons.check_box),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedScreen()))
                    }),
          ]),

      /// PAGE COLOR
      backgroundColor: ColorConstant.purple50,

      /// ACTUAL CONTENT STARTS HERE--------------------------
      body: Column(children: [
        // UPCOMING PAGE TITLE
        AppBar(
          title: Center(
            child: Text(
              "Completed Assignments",
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
                return ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (BuildContext context, int index) =>
                      taskList[index].markedDone
                          ? _buildCompletedTask(context, taskList[index])
                          : _skipUnfinishedTask(),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return ListView.builder(
                itemCount: snapshot.data == null ? 0 : snapshot.data?.length,
                itemBuilder: (BuildContext context, int index) =>
                    snapshot.data![index].markedDone
                        ? _buildCompletedTask(context, snapshot.data![index])
                        : _skipUnfinishedTask(),
              );
            },
          ),
        ),
      ]),
    ));
  }

  Widget _skipUnfinishedTask() {
    return Text("");
  }

  Widget _buildCompletedTask(BuildContext context, dynamic task) {
    return SingleChildScrollView(
      child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 212, 212, 212),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
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
                      task.className!,
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
                      task.assignmentName!,
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
                    Text(task.difficulty != null ? task.difficulty! : "Hard"),
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
          //onTap: () => {
          //Navigator.push(
          //context,
          //MaterialPageRoute(
          //builder: (context) => AssignmentScreen(task)))
          //}),
          onTap: () async {
            bool refresh = await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AssignmentScreen(task)));
            if (refresh == false) {
              changeData();
            }
          }),
    );
  }
}
