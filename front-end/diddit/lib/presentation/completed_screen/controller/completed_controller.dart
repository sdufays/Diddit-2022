import '/core/app_export.dart';
import 'package:diddit_final/presentation/completed_screen/models/completed_model.dart';

class CompletedController extends GetxController {
  Rx<CompletedModel> completedModelObj = CompletedModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
