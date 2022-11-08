import '../controller/upcoming_controller.dart';
import 'package:get/get.dart';

class UpcomingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpcomingController());
  }
}
