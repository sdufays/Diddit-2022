import 'controller/assignment_controller.dart';
import 'package:diddit_final/core/app_export.dart';
import 'package:diddit_final/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:diddit_final/presentation/upcoming_screen/upcoming_screen.dart';
import 'package:diddit_final/presentation/completed_screen/completed_screen.dart';

// i think should be stateless and have a "task" attribute that takes from task list
// assignment widget must have a TASK AS A PARAMETER
class AssignmentScreen extends StatelessWidget {
  final dynamic task;
  AssignmentScreen(this.task);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.whiteA700,

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text('${task.assignmentName}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                )),
            Text('Class: ${task.className}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  color: task.classColor,
                )),
            SizedBox(height: 60),
            Text(
              'Assignment Description',
              textAlign: TextAlign.center,
            ),
            Text('${task.teacherDesc}', textAlign: TextAlign.center),
            SizedBox(height: 60),
            SizedBox(
                width: 50,
                height: 50,
                child: TextButton(
                  child: task.markedDone
                      ? Text("Mark as unfinished")
                      : Text("Mark as done"),
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.all(16.0)),
                  onPressed: () async {
                    if (this.task.markedDone == false) {
                      Navigator.pop(context, this.task.markedDone = true);
                    } else {
                      Navigator.pop(context, this.task.markedDone = false);
                    }
                  },
                )),
          ],
        ));
  }
}
