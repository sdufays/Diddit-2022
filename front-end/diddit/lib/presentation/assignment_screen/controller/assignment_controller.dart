import '/core/app_export.dart';
import 'package:diddit_final/presentation/assignment_screen/models/assignment_model.dart';

class AssignmentController extends GetxController {
  Rx<AssignmentModel> assignmentModelObj = AssignmentModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
