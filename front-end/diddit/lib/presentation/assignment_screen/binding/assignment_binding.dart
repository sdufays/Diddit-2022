import '../controller/assignment_controller.dart';
import 'package:get/get.dart';

class AssignmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssignmentController());
  }
}
