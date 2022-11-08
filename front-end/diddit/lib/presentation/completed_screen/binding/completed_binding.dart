import '../controller/completed_controller.dart';
import 'package:get/get.dart';

class CompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CompletedController());
  }
}
